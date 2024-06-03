import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_simple_response_model.dart';
import '../../../data/constants/string_constants.dart';

class NewPasswordController extends GetxController {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();
  FocusNode focusNewPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();
  final isNewPassword = false.obs;
  final isCnfPassword = false.obs;
  final passwordHide = true.obs;

  void startListener() {
    focusNewPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isNewPassword.value = focusNewPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;
  final showLoading = false.obs;
  Map<String, String> bodyParams = {};
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

  clickOnSaveButton() async {
    if (cnfPasswordController.text.trim().isNotEmpty ||
        newPasswordController.text.trim().isNotEmpty) {
      showLoading.value = true;
      bodyParams = {
        ApiKeyConstants.password: cnfPasswordController.text,
        ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? '',
        ApiKeyConstants.type: parameters[ApiKeyConstants.type] ?? 'email'
      };

      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.resetPassword(bodyParams: bodyParams);
      if (simpleResponseModel != null && simpleResponseModel.status == '1') {
        showLoading.value = false;
        Get.toNamed(Routes.VERIFY_IDENTITY);
      } else {
        CommonWidgets.snackBarView(title: simpleResponseModel!.message!);
      }
      showLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
