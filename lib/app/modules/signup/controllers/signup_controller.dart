import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';
import '../../../data/constants/string_constants.dart';

class SignupController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusFullName = FocusNode();
  FocusNode focusMobile = FocusNode();
  final isEmail = false.obs;
  final isPassword = false.obs;
  final isFullName = false.obs;
  final isMobile = false.obs;
  final passwordHide = true.obs;
  final checkBox = false.obs;
  final showLoading = false.obs;

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusMobile.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isMobile.value = focusMobile.hasFocus;
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

  changeCheckBox() {
    checkBox.value = !checkBox.value;
  }

  clickOnSignUpButton() {
    if (checkBox.value) {
      signUpApiCalling();
    } else {
      CommonWidgets.showMyToastMessage(
          'Please Checked Terms of Service and Privacy Policy');
    }
    //Get.toNamed(Routes.SIGNUP);
  }

  clickOnLoginButton() {
    Get.back();
  }

  signUpApiCalling() async {
    if (fullNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        mobileController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty) {
      showLoading.value = true;
      Map<String, String> bodyParams = {
        ApiKeyConstants.userName: fullNameController.text,
        ApiKeyConstants.email: emailController.text,
        ApiKeyConstants.password: passwordController.text,
        ApiKeyConstants.mobile: mobileController.text,
      };
      UserModel? userModel =
          await ApiMethods.userSignup(bodyParams: bodyParams);
      if (userModel != null &&
          userModel.result != null &&
          userModel.result!.id != null &&
          userModel.result!.id!.isNotEmpty) {
        CommonWidgets.snackBarView(title: userModel.message ?? '');
        Get.back();
      } else {
        CommonWidgets.snackBarView(title: userModel!.message ?? '');
      }
      showLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
