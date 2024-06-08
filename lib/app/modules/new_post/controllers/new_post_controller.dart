import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPostController extends GetxController {
  TextEditingController captionController = TextEditingController();
  File imageFile = Get.arguments;
  final isCaption = false.obs;
  FocusNode captionFocus = FocusNode();
  void startListener() {
    captionFocus.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCaption.value = captionFocus.hasFocus;
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
}
