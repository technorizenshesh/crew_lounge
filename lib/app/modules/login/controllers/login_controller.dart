import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  final isEmail = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  final showLoading = false.obs;
  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
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
  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
    increment();
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGNUP);
  }

  clickOnForgotPasswordButton() {
    Get.toNamed(Routes.PASSWORD_RESET);
  }

  // clickOnLoginButton() {
  //   Get.toNamed(Routes.NAV_BAR);
  // }

  clickOnLoginButton() async {
    if (emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      showLoading.value = true;
      Map<String, String> bodyParams = {
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.password: passwordController.text
      };
      UserModel? userModel = await ApiMethods.login(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.result != null &&
          userModel.result != null &&
          userModel.result!.id != null) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString(ApiKeyConstants.token, userModel.result!.token!);
        sp.setString(ApiKeyConstants.userId, userModel.result!.id!);
        Get.toNamed(Routes.NAV_BAR);
      } else {
        CommonWidgets.snackBarView(title: userModel!.message!);
      }
      showLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
