import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_simple_response_model.dart';
import '../../../data/constants/string_constants.dart';

class OtpController extends GetxController {
  TextEditingController pin = TextEditingController();
  final showLoading = false.obs;
  Map<String, String> bodyParams = {};
  final count = 0.obs;

  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
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
    if (pin.text.trim().isNotEmpty) {
      showLoading.value = true;
      bodyParams = {
        ApiKeyConstants.otp: pin.text,
        ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? '',
        ApiKeyConstants.type: parameters[ApiKeyConstants.type] ?? 'email'
      };

      SimpleResponseModel? simpleResponseModel =
          await ApiMethods.checkOtp(bodyParams: bodyParams);
      if (simpleResponseModel != null && simpleResponseModel.status == '1') {
        showLoading.value = false;
        Map<String, String> data = {
          ApiKeyConstants.type: parameters[ApiKeyConstants.type] ?? 'email',
          ApiKeyConstants.email: parameters[ApiKeyConstants.email] ?? ''
        };
        Get.toNamed(Routes.NEW_PASSWORD, parameters: data);
      } else {
        CommonWidgets.snackBarView(title: simpleResponseModel!.message!);
      }
      showLoading.value = false;
    } else {
      CommonWidgets.snackBarView(title: StringConstants.allFieldsRequired);
    }
  }
}
