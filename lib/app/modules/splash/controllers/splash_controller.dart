import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  SharedPreferences? prefs;
  final count = 0.obs;
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    manageSession();
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

  manageSession() async {
    await Future.delayed(const Duration(seconds: 3));
    print("TOKEN:::::::::::${prefs?.getString(ApiKeyConstants.token)}");
    if (prefs?.getString(ApiKeyConstants.token) != null) {
      Get.offAllNamed(Routes.NAV_BAR);
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
