import 'package:get/get.dart';

import '../controllers/close_friends_controller.dart';

class CloseFriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CloseFriendsController>(
      () => CloseFriendsController(),
    );
  }
}
