import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CloseFriendsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var searchHistory = [
    'Jordyn Philips',
    'Jocelyn Workman',
    'Nolan Rhiel Madsen',
    'Favourite food',
    'Makenna Geidt'
  ];
  var hotCircle = [
    "https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHZmgTTTZhXAoNOiDirLHYLSTieoUrSsZFnnmyCDPs_8_KLtgbpXWdEI9AL2yiqWEvaP4&usqp=CAU",
    "https://image.shutterstock.com/image-photo/bowl-buddha-buckwheat-pumpkin-chicken-260nw-1259570605.jpg",
    "https://images.unsplash.com/photo-1543353071-873f17a7a088?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9vZCUyMHByZXNlbnRhdGlvbnxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://image.shutterstock.com/image-photo/food-photography-260nw-578546905.jpg"
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
