import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class SettingController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() async {
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

  openNewPage(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.CLOSE_FRIENDS);
        break;
      case 1:
        Get.toNamed(Routes.CHANGE_PASSWORD);
        break;
      case 2:
        //Get.toNamed('/setting');
        break;
      case 3:
        // Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 4:
        Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 5:
        Get.toNamed(Routes.TERMS_CONDITION);
        break;
      case 6:
        // Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 7:
        // Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 8:
        CommonWidgets.showAlertDialog(
          onPressedYes: () => clickOnYes(),
        );
        break;
      default:
        Get.toNamed(Routes.PRIVACY_POLICY);
        break;
    }
  }

  clickOnYes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    Get.delete<NavBarController>();
    Get.offAllNamed(Routes.SPLASH);
    Get.toNamed(Routes.LOGIN);
  }
}
