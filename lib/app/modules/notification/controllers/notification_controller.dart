import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<String> titleList = [
    'Nolan Lubin',
    'Leo Westervelt',
    'Kaiya Septimus',
    'Bitcoin',
    'Nolan Lubin',
  ];
  List<String> notificationImages = [
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png',
    'assets/un_used_images/story3.png',
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png'
  ];

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
}
