import 'package:crew_lounge/app/data/apis/api_models/get_notification.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class NotificationController extends GetxController {
  // List<String> titleList = [
  //   'Nolan Lubin',
  //   'Leo Westervelt',
  //   'Kaiya Septimus',
  //   'Bitcoin',
  //   'Nolan Lubin',
  // ];
  // List<String> notificationImages = [
  //   'assets/un_used_images/story1.png',
  //   'assets/un_used_images/story2.png',
  //   'assets/un_used_images/story3.png',
  //   'assets/un_used_images/story1.png',
  //   'assets/un_used_images/story2.png'
  // ];
  List<NotificationResult> notificationsList = [];

  Map<String, String?> parameters = Get.parameters;

  final inAsyncCall = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getMyPostsApi();
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

  Future<void> getMyPostsApi() async {
    Map<String, dynamic> queryParameter = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
    };
    NotificationModel? notificationModel =
        await ApiMethods.getNotificationApi(queryParameters: queryParameter);
    if (notificationModel != null && notificationModel.result != null) {
      notificationsList = notificationModel.result!;
      increment();
    }
    inAsyncCall.value = false;
  }
}
