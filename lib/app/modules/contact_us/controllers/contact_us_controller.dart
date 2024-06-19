import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_contact_us_model.dart';

class ContactUsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusMessage = FocusNode();
  final isName = false.obs;
  final isEmail = false.obs;
  final isMessage = false.obs;
  final inAsyncCall = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusMessage.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isMessage.value = focusMessage.hasFocus;
  }

  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;

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

  Future<void> submitMessage() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      ApiKeyConstants.name: nameController.text,
      ApiKeyConstants.email: emailController.text,
      ApiKeyConstants.message: messageController.text,
    };
    inAsyncCall.value = true;
    ContactUsModel? contactUsModel =
        await ApiMethods.contactUsApi(bodyParams: queryParameters);
    if (contactUsModel != null && contactUsModel.status == '1') {
      CommonWidgets.showMyToastMessage('Send message successfully completed.');
    } else {
      CommonWidgets.showMyToastMessage(contactUsModel?.message ?? '');
    }
    inAsyncCall.value = false;
  }
}
