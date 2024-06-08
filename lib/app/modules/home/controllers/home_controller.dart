import 'package:crew_lounge/app/data/apis/api_models/get_posts_model.dart';
import 'package:crew_lounge/app/data/apis/api_models/get_simple_response_model.dart';
import 'package:crew_lounge/app/routes/app_pages.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class HomeController extends GetxController {
  final List<SwipeItem> swipeItems = [];
  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<GetPostResult> postList = [];
  List<String> storiesImages = [
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png',
    'assets/un_used_images/story3.png',
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png',
    'assets/un_used_images/story3.png'
  ];
  List<String> storiesName = [
    'My Story',
    'Selena',
    'Clara',
    'Fabian',
    'George',
    'Selena',
  ];
  String userId = '';

  final count = 0.obs;
  final inAsyncCall = true.obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getPostsApi();
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

  clickOnSearchIcon() {
    Get.toNamed(Routes.MY_SEARCH);
  }

  clickOnNotificationIcon() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  clickOnChatIcon(int index) {
    Map<String, String> data = {
      ApiKeyConstants.otherUserId: postList[index].userId ?? '',
      ApiKeyConstants.userName: postList[index].userName ?? '',
      ApiKeyConstants.image: postList[index].userImage ?? '',
    };
    Get.toNamed(Routes.MESSAGE, parameters: data);
  }

  Future<void> getPostsApi() async {
    Map<String, dynamic> queryParameter = {
      ApiKeyConstants.userId: userId,
    };
    GetPostListModel? getPostListModel =
        await ApiMethods.getPostsApi(queryParameters: queryParameter);
    if (getPostListModel != null && getPostListModel.result != null) {
      postList = getPostListModel.result!;
      await setDataOnSwipeCard(getPostListModel.result!);
      inAsyncCall.value = false;
      // increment();
    }
  }

  setDataOnSwipeCard(List<GetPostResult> list) {
    swipeItems.clear();
    for (int i = 0; i < list.length; i++) {
      swipeItems.add(SwipeItem(
          content: list[i],
          likeAction: () {
            print('Hello like...');
            likeUnlikeByPostId(list[i].id ?? '');
          },
          nopeAction: () {
            print('Hello nope...');
          },
          superlikeAction: () {
            print('Hello super like...');
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
      matchEngine = MatchEngine(swipeItems: swipeItems);
    }
  }

  Future<void> likeUnlikeByPostId(String postId) async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.postId: postId,
    };
    SimpleResponseModel? simpleResponseModel =
        await ApiMethods.likeUnLikePost(queryParameters: queryParameters);
    if (simpleResponseModel != null && simpleResponseModel.status == '1') {
      CommonWidgets.showMyToastMessage(simpleResponseModel.message ?? '');
    }
  }
}
