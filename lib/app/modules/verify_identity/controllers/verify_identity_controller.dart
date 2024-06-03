import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VerifyIdentityController extends GetxController {
  //TODO: Implement VerifyIdentityController

  final count = 0.obs;
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

  clickOnPlushIcon() {
    Get.toNamed(Routes.VERIFY_IDENTY_COMPLETE);
  }
}
