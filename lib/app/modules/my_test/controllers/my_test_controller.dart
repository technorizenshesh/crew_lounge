import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class MyTestController extends GetxController {
  final List<SwipeItem> swipeItems = [];
  late MatchEngine matchEngine;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<String> images = [
    "https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZmgTTTZhXAoNOiDirLHYLSTieoUrSsZFnnmyCDPs_8_KLtgbpXWdEI9AL2yiqWEvaP4&usqp=CAU",
    "https://image.shutterstock.com/image-photo/bowl-buddha-buckwheat-pumpkin-chicken-260nw-1259570605.jpg",
    "https://images.unsplash.com/photo-1543353071-873f17a7a088?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHByZXNlbnRhdGlvbnxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.shutterstock.com/image-photo/food-photography-260nw-578546905.jpg"
  ];

  final count = 0.obs;
  @override
  void onInit() {
    for (int i = 0; i < images.length; i++) {
      swipeItems.add(SwipeItem(
          content: images[i],
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
      matchEngine = MatchEngine(swipeItems: swipeItems);
    }
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
