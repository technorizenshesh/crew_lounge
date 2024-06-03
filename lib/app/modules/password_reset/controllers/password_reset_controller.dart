import 'package:crew_lounge/app/data/apis/api_models/get_simple_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class PasswordResetController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isEmail = false.obs;
  final isPhone = false.obs;
  final showLoading = false.obs;
  final type = 'email'.obs;
  final email = ''.obs;
  Map<String, String> bodyParams = {};

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
    if (emailController.text.trim().isNotEmpty ||
        phoneController.text.trim().isNotEmpty) {
      showLoading.value = true;
      if (emailController.text.isNotEmpty) {
        type.value = 'email';
        email.value = emailController.text;
        bodyParams = {
          ApiKeyConstants.email: emailController.text,
          ApiKeyConstants.type: 'email',
        };
      } else {
        type.value = 'mobile';
        email.value = phoneController.text;
        bodyParams = {
          ApiKeyConstants.email: phoneController.text,
          ApiKeyConstants.type: 'mobile'
        };
      }

      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.sendOtpForPassword(bodyParams: bodyParams);
      if (simpleResponseModel != null && simpleResponseModel.status == '1') {
        showLoading.value = false;
        Map<String, String> data = {
          ApiKeyConstants.type: type.value,
          ApiKeyConstants.email: email.value
        };
        Get.toNamed(Routes.OTP, parameters: data);
      } else {
        CommonWidgets.snackBarView(title: simpleResponseModel!.message!);
      }
      showLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
