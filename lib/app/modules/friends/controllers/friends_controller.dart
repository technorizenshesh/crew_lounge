import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_posts_model.dart';

class FriendsController extends GetxController {
  final inAsyncCall = true.obs;
  final List<SwipeItem> swipeItems = [];
  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<GetPostResult> likePostsList = [];

  String userId = '';

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString(ApiKeyConstants.userId) ?? '';
    await getLikePostsApi();
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

  Future<void> getLikePostsApi() async {
    Map<String, dynamic> queryParameter = {
      ApiKeyConstants.userId: userId,
    };
    GetPostListModel? getPostListModel =
        await ApiMethods.getLikePostsApi(queryParameters: queryParameter);
    if (getPostListModel != null && getPostListModel.result != null) {
      likePostsList = getPostListModel.result!;
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
}
