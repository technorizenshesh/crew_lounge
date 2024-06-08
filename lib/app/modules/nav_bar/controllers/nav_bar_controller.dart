import 'package:crew_lounge/app/modules/chats/views/chats_view.dart';
import 'package:crew_lounge/app/modules/friends/views/friends_view.dart';
import 'package:crew_lounge/app/modules/home/views/home_view.dart';
import 'package:crew_lounge/app/modules/post/views/post_view.dart';
import 'package:crew_lounge/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

final selectedIndex = 0.obs;

class NavBarController extends GetxController {
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

  body() {
    switch (selectedIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        return const FriendsView();
      // return const MyTestView();
      case 2:
        return const PostView();
      case 3:
        return const ChatsView();
      case 4:
        return const ProfileView();
    }
  }
}
