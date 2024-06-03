import 'package:get/get.dart';

import '../controllers/verify_identy_complete_controller.dart';

class VerifyIdentyCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyIdentyCompleteController>(
      () => VerifyIdentyCompleteController(),
    );
  }
}
