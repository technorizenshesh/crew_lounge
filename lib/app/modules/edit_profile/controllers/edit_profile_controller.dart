import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:crew_lounge/app/data/apis/api_constants/api_key_constants.dart';
import 'package:crew_lounge/app/data/apis/api_models/get_user_model.dart';
import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/common_pickImage.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:crew_lounge/common/image_pick_and_crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/colors.dart';
import '../../../../common/date_picker.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class EditProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final isFullName = false.obs;
  final isEmail = false.obs;
  final isDob = false.obs;
  final isPhone = false.obs;
  final isGender = false.obs;
  final selectImage = Rxn<File>();
  final isLoading = false.obs;
  final profileImage = ''.obs;
  final countryDailCode = '+91'.obs;
  Map<String, File> imageMap = {};
  Map<String, dynamic> bodyParamsForUpdateProfile = {};

  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusDob = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusGender = FocusNode();
  late SharedPreferences sharedPreferences;
  UserModel myData = Get.arguments;

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isDob.value = focusDob.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isGender.value = focusGender.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fullNameController.text = myData.result!.userName ?? '';
    emailController.text = myData.result!.email ?? '';
    phoneController.text = myData.result!.mobile ?? '';
    dobController.text = myData.result!.dob ?? '';
    genderController.text = myData.result!.gender ?? '';
    profileImage.value = myData.result!.image ?? '';
    //countryDailCode.value = myData.result!.c ?? '';
    startListener();
    increment();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  clickOnCountryCode({required CountryCode value}) {
    countryDailCode.value = value.dialCode.toString();
  }

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dobController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }

  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
      );

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> pickCamera() async {
    selectImage.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
    selectImage.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    increment();
  }

  Future<void> callingUpdateProfile() async {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        dobController.text.isNotEmpty &&
        genderController.text.isNotEmpty) {
      try {
        if (selectImage.value != null) {
          imageMap = {
            ApiKeyConstants.image: selectImage.value ?? File(''),
          };
          bodyParamsForUpdateProfile = {
            ApiKeyConstants.userId: myData.result!.id,
            ApiKeyConstants.token: myData.result!.token,
            ApiKeyConstants.userName: fullNameController.text.toString(),
            ApiKeyConstants.mobile: phoneController.text.toString(),
            ApiKeyConstants.dob: dobController.text.toString(),
            ApiKeyConstants.gender: genderController.text.toString(),
          };
        } else {
          bodyParamsForUpdateProfile = {
            ApiKeyConstants.userId: myData.result!.id,
            ApiKeyConstants.token: myData.result!.token,
            ApiKeyConstants.userName: fullNameController.text.toString(),
            ApiKeyConstants.mobile: phoneController.text.toString(),
            ApiKeyConstants.dob: dobController.text.toString(),
            ApiKeyConstants.gender: genderController.text.toString(),
            ApiKeyConstants.image: '',
          };
        }
        isLoading.value = true;
        print(
            "bodyParamsForUpdateProfileParams:::::$bodyParamsForUpdateProfile");
        UserModel? userModel = await ApiMethods.updateProfileApi(
            bodyParams: bodyParamsForUpdateProfile, imageMap: imageMap);
        if (userModel!.status != "0" ?? false) {
          saveDataSharedPreference(userModel);
          CommonWidgets.showMyToastMessage(userModel.message!);
        } else {
          isLoading.value = false;
          print("Profile Update Failed....");
          CommonWidgets.showMyToastMessage(userModel.message!);
        }
      } catch (e) {
        isLoading.value = false;
        print('Error :-${e.toString()}');
        CommonWidgets.showMyToastMessage(e.toString());
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields...');
    }
  }

  saveDataSharedPreference(UserModel? userdata) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(
        ApiKeyConstants.token, userdata!.result!.token!);
    sharedPreferences.setString(ApiKeyConstants.userId, userdata.result!.id!);
    isLoading.value = false;
  }
}
