import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_add_post_model.dart';
import '../../../data/constants/string_constants.dart';

class NewPostController extends GetxController {
  TextEditingController captionController = TextEditingController();
  File imageFile = Get.arguments;
  final isCaption = false.obs;
  final inAsyncCall = false.obs;
  FocusNode captionFocus = FocusNode();
  void startListener() {
    captionFocus.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCaption.value = captionFocus.hasFocus;
  }

  String userId = '';
  Map<String, dynamic> bodyParams = {};
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    startListener();
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

  clickOnSubmitButton() async {
    if (captionController.text.trim().isNotEmpty && imageFile != null) {
      try {
        inAsyncCall.value = true;
        bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.description: captionController.text,
          ApiKeyConstants.location: 'indore',
          ApiKeyConstants.lat: '22.097',
          ApiKeyConstants.lon: '27.097',
        };
        AddPostModel? addPostModel = await ApiMethods.uploadNewPost(
            bodyParams: bodyParams, imageFile: imageFile);
        if (addPostModel != null && addPostModel.status == '1') {
          //  CommonWidgets.showMyToastMessage(addPostModel.message ?? '');
        } else {
          CommonWidgets.showMyToastMessage(addPostModel!.message ?? '');
        }
        inAsyncCall.value = false;
      } catch (e) {
        inAsyncCall.value = false;
        print("Error:- ${e.toString()}");
      }
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
