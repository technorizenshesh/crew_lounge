import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusDob = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusGender = FocusNode();

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
