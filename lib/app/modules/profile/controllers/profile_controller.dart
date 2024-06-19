import 'package:crew_lounge/app/data/apis/api_models/get_my_posts_model.dart';
import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';

class ProfileController extends GetxController {
  String userId = '';

  final inAsyncCall = true.obs;
  Map<String, String> queryParameters = {};
  List<GetMyPostResult> imagePostList = [];
  UserModel? userData;

  final count = 0.obs;
  @override
  void onInit() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    await getProfileApi();
    inAsyncCall.value = false;
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

  clickOnEditProfile() {
    Get.toNamed(Routes.EDIT_PROFILE, arguments: userData!);
  }

  clickOnSetting() {
    Map<String, String> data = {
      ApiKeyConstants.userId: userId,
    };
    Get.toNamed(Routes.SETTING, parameters: data);
  }

  Future<void> getProfileApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
    };
    UserModel? userModel =
        await ApiMethods.getProfile(queryParameters: queryParameters);
    if (userModel != null) {
      userData = userModel;
      increment();
      getMyPostsApi();
    }
  }

  Future<void> getMyPostsApi() async {
    Map<String, dynamic> queryParameter = {
      ApiKeyConstants.userId: userId,
    };
    GetMyPostModel? getPostListModel =
        await ApiMethods.getMyPostsApi(queryParameters: queryParameter);
    if (getPostListModel != null && getPostListModel.result != null) {
      imagePostList = getPostListModel.result!;
      increment();
    }
  }

  String getZodiacSign(String dob) {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      DateTime birthdate = dateFormat.parse("$dob 00:00:00");
      const List<String> signNames = [
        "Capricorn",
        "Aquarius",
        "Pisces",
        "Aries",
        "Taurus",
        "Gemini",
        "Cancer",
        "Leo",
        "Virgo",
        "Libra",
        "Scorpio",
        "Sagittarius",
        "Capricorn"
      ];
      const List<int> signDays = [
        0,
        22,
        20,
        21,
        21,
        22,
        23,
        23,
        23,
        23,
        23,
        22,
        22
      ];

      if (birthdate.day < signDays[birthdate.month])
        return signNames[birthdate.month - 1];
      else
        return signNames[birthdate.month];
    } catch (e) {
      return '';
    }
  }
}
