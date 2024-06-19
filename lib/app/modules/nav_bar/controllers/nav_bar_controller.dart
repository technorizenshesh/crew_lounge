import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/app/modules/chats/views/chats_view.dart';
import 'package:crew_lounge/app/modules/friends/views/friends_view.dart';
import 'package:crew_lounge/app/modules/home/views/home_view.dart';
import 'package:crew_lounge/app/modules/post/views/post_view.dart';
import 'package:crew_lounge/app/modules/profile/views/profile_view.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';

final selectedIndex = 0.obs;

class NavBarController extends GetxController {
  final count = 0.obs;
  SharedPreferences? prefs;

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    setUserOnlineStatus('ONLINE');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    await setUserOnlineStatus('OFFLINE');
    super.onClose();
  }

  void increment() => count.value++;

  body() {
    switch (selectedIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        return const FriendsView();
      case 2:
        return const PostView();
      case 3:
        return const ChatsView();
      case 4:
        return const ProfileView();
    }
  }

  Future<void> setUserOnlineStatus(String onlineStatus) async {
    Map<String, dynamic> bodyParams = {
      ApiKeyConstants.userId: prefs?.getString(ApiKeyConstants.userId) ?? '',
      ApiKeyConstants.onlineStatus: onlineStatus,
    };
    UserModel? userModel =
        await ApiMethods.changeOnlineStatusApi(bodyParams: bodyParams);
    if (userModel != null && userModel.status == '1') {
      print('Update Online Status successfully...');
    } else {
      print('Update Online Status fielded...');
    }
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Center(
              child: Text(
                StringConstants.exitApp,
                style: MyTextStyle.titleStyle18bb,
              ),
            ),
            content: Text(
              StringConstants.doYouWantToExitTheApp,
              style: MyTextStyle.titleStyle16blb,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () => Get.back(canPop: false),
                      child: Text(StringConstants.no,
                          style: MyTextStyle.titleStyleCustom(
                              16, FontWeight.normal, Colors.green)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () async {
                        await setUserOnlineStatus('OFFLINE');
                        Get.back(canPop: true);
                        SystemNavigator.pop();
                      },
                      child: Text(StringConstants.yes,
                          style: MyTextStyle.titleStyleCustom(
                              16.px, FontWeight.normal, Colors.redAccent)),
                    ),
                  )
                ],
              )
            ],
          ),
        )) ??
        false;
  }
}
