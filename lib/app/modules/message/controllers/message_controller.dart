import 'dart:async';
import 'dart:io';

import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_chat_message_model.dart';
import '../../../data/constants/string_constants.dart';

class MessageController extends GetxController {
  final count = 0.obs;
  TextEditingController textController = TextEditingController();
  Map<String, String?> parameters = Get.parameters;
  String otherUserId = '';
  String userId = '';
  String userName = '';
  String lastMessage = '';

  final inAsyncCall = false.obs;
  final buttonValue = false.obs;

  GetChatModel? getChatModel;
  List<GetChatResult> result = [];
  Map<String, dynamic> bodyParams = {};
  final progress = 0.0.obs;

  var listMessages;

  ScrollController scrollController = ScrollController();
  final image = Rxn<File?>();
  final imageUrl = ''.obs;

  Timer? periodicTimer;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    otherUserId = parameters[ApiKeyConstants.otherUserId] ?? '';
    userName = parameters[ApiKeyConstants.userName] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    stopPeriodicApiCalls();
    super.onClose();
  }

  void increment() => count.value++;

  void startPeriodicApiCalls() {
    bool isProcessing = false;
    periodicTimer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      if (!isProcessing) {
        isProcessing = true;
        try {
          await getChatApi();
        } catch (e) {
          print("Error fetching chat API: $e");
          // Handle the error, maybe stop the timer if needed
        } finally {
          isProcessing = false;
        }
      }
    });
  }

  void stopPeriodicApiCalls() {
    periodicTimer?.cancel();
  }

  Future<void> onInitWork() async {
    await getChatApi();
    startPeriodicApiCalls();
  }

  Future<void> getChatApi() async {
    bodyParams = {
      ApiKeyConstants.senderId: '1',
      ApiKeyConstants.receiverId: userId.toString(),
    };
    getChatModel =
        await ApiMethods.getChat(bodyParams: bodyParams, wantSnackBar: false);
    if (getChatModel != null &&
        getChatModel!.result != null &&
        getChatModel!.result!.isNotEmpty) {
      result = getChatModel!.result!;
      increment();
      jump();
    }
  }

  clickOnSendButton() async {
    if (image.value != null || textController.text.trim().isNotEmpty) {
      buttonValue.value = true;
      await chatsApi();
      textController.clear();
      buttonValue.value = false;
      jump();
    } else {
      CommonWidgets.snackBarView(title: 'Nothing to send');
    }
  }

  String getChatId(String senderId, String userId) {
    if (int.parse(senderId) == int.parse(userId)) {
      return userId;
    } else if (int.parse(senderId) > int.parse(userId)) {
      return "${userId}_to_$senderId";
    } else {
      return "${senderId}_to_$userId";
    }
  }

  Future<void> chatsApi() async {
    bodyParams = {
      ApiKeyConstants.senderId: userId.toString(),
      ApiKeyConstants.receiverId: '1',
      ApiKeyConstants.chatMessage: textController.text.trim().toString(),
    };
    http.Response? response = await ApiMethods.insertChat(
        bodyParams: bodyParams,
        imageKey: ApiKeyConstants.chatImage,
        image: image.value,
        wantSnackBar: false);
    if (response != null && response.statusCode == 200) {
      // await onInitWork();
      if (image.value != null) {
        Get.back();
      }
      await getChatApi();
    }
  }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }
    if (dayNum >= 10) {
      return '$dayNum';
    } else {
      return '0$dayNum';
    }
  }

  String getMonthOfYearSuffix(int monthNum) {
    if (!(monthNum >= 1 && monthNum <= 12)) {
      throw Exception('Invalid month of Year');
    }

    if (monthNum >= 10) {
      return '$monthNum';
    }

    switch (monthNum % 10) {
      case 1:
        return '0$monthNum';
      case 2:
        return '0$monthNum';
      case 3:
        return '0$monthNum';
      default:
        return '0$monthNum';
    }
  }

  clickOnBackButton() async {
    //chatsApi();
    Get.back();
  }

  jump() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.extentTotal);
    });
  }

  clickOnAttachmentButton() {
    selectImageType();
  }

  selectImageType() {
    showCupertinoModalPopup<void>(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Select File Type',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 14.px, color: Theme.of(context).primaryColor),
        ),
        content: Text(
          'Please select any file type for send message',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Get.back();
              pickGallery(false, 'pdf');
            },
            child: Text('Pdf',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Get.back();
              pickGallery(false, 'image');
            },
            child: Text(StringConstants.camera,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Get.back();
              pickGallery(true, 'image');
            },
            child: Text(StringConstants.gallery,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    );
  }

  Future<void> pickGallery(bool pickImageFromGallery, String type) async {
    CommonMethods.unFocsKeyBoard();
    if (pickImageFromGallery == false && type == 'pdf') {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null) {
        image.value = File(result.files.single.path!);
      } else {
        // User canceled the picker
      }
    } else {
      image.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: pickImageFromGallery);
    }

    if (image.value != null) {
      showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: Get.context!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14.px),
            topLeft: Radius.circular(14.px),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Image View',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              imageUrl.value = '';
                              image.value = null;
                              textController.clear;
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Theme.of(Get.context!).primaryColor,
                              size: 24.px,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Container(
                        height: 100.px,
                        width: 100.px,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.px),
                          child: image.value.toString().contains('.pdf')
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.picture_as_pdf_outlined,
                                      size: 50.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                      image.value!.path.split('/').last,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              : Image.file(image.value ?? File(''),
                                  height: 80.px, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: textController,
                        // onFieldSubmitted: (value) => controller.clickOnSendButton(),
                        borderRadius: 30.px,
                        // onTap: () => controller.jump(),
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2),
                        hintText: StringConstants.typeHere,
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(() {
                                count.value;
                                return buttonValue.value
                                    ? SizedBox(
                                        height: 24.px,
                                        width: 24.px,
                                        child:
                                            const CircularProgressIndicator())
                                    : InkWell(
                                        borderRadius:
                                            BorderRadius.circular(18.px),
                                        onTap: () => clickOnSendButton(),
                                        child: Image.asset(
                                          IconConstants.icSend,
                                          height: 34.px,
                                          width: 34.px,
                                        ),
                                      );
                              })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).whenComplete(() {
        imageUrl.value = '';
        image.value = null;
        textController.clear;
      });
    }
    increment();
  }

  clickOnChatImagesAndDownload(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ${url}');
    }
  }

  bool checkDateShowOrNot(String? previousTimeStm, String? currentTimeStm) {
    try {
      DateTime previousDate = DateTime.parse(previousTimeStm!);
      DateTime currentDate = DateTime.parse(currentTimeStm!);

      return previousDate.year == currentDate.year &&
          previousDate.month == currentDate.month &&
          previousDate.day == currentDate.day;
    } catch (e) {
      return false;
    }
  }
}
