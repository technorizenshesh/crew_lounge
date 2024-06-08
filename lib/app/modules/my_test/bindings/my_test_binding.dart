import 'package:get/get.dart';

import '../controllers/my_test_controller.dart';

class MyTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTestController>(
      () => MyTestController(),
    );
  }
}
