import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_simple_response_model.dart';

class SettingController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
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
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
    };
    switch (index) {
      case 0:
        Get.toNamed(Routes.CLOSE_FRIENDS, parameters: data);
        break;
      case 1:
        Get.toNamed(Routes.CHANGE_PASSWORD, parameters: data);
        break;
      case 2:
        //Get.toNamed('/setting');
        break;
      case 3:
        // Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 4:
        Get.toNamed(Routes.PRIVACY_POLICY, parameters: data);
        break;
      case 5:
        Get.toNamed(Routes.TERMS_CONDITION, parameters: data);
        break;
      case 6:
        Get.toNamed(Routes.CONTACT_US, parameters: data);
        break;
      case 7:
        // Get.toNamed(Routes.PRIVACY_POLICY);
        break;
      case 8:
        CommonWidgets.showAlertDialog(
            onPressedYes: () => deleteAccount(),
            title: StringConstants.deleteAccount,
            content: StringConstants.wouldYouLikeToDeleteAccount);
        break;
      case 9:
        CommonWidgets.showAlertDialog(
          onPressedYes: () => clickOnYes(),
        );
        break;
      default:
        Get.toNamed(Routes.PRIVACY_POLICY, parameters: data);
        break;
    }
  }

  clickOnYes() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    Get.offAllNamed(Routes.SPLASH);
  }

  clickOnDeleteAccount() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ApiKeyConstants.token, '');
    sharedPreferences.clear();
    Get.offAllNamed(Routes.SPLASH);
  }

  Future<void> deleteAccount() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
    };
    inAsyncCall.value = true;
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.deleteAccountApi(bodyParams: queryParameters);
    if (simpleResponseModel != null && simpleResponseModel.status == '1') {
      CommonWidgets.showMyToastMessage(simpleResponseModel.message ?? '');
      clickOnDeleteAccount();
    } else {
      CommonWidgets.showMyToastMessage(simpleResponseModel?.message ?? '');
    }
    inAsyncCall.value = false;
    increment();
  }
}
