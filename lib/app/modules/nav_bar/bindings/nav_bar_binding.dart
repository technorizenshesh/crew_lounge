import 'package:crew_lounge/app/modules/chats/controllers/chats_controller.dart';
import 'package:crew_lounge/app/modules/friends/controllers/friends_controller.dart';
import 'package:crew_lounge/app/modules/post/controllers/post_controller.dart';
import 'package:crew_lounge/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PostController>(
      () => PostController(),
    );
    Get.lazyPut<FriendsController>(
      () => FriendsController(),
    );
    Get.lazyPut<ChatsController>(
      () => ChatsController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
