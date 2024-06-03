import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';

class ChatsController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final isSearch = false.obs;
  FocusNode focusSearch = FocusNode();
  void startListener() {
    focusSearch.addListener(onFocusChange);
  }

  void onFocusChange() {
    isSearch.value = focusSearch.hasFocus;
  }

  List<String> storiesImages = [
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png',
    'assets/un_used_images/story3.png',
    'assets/un_used_images/story1.png',
    'assets/un_used_images/story2.png',
    'assets/un_used_images/story3.png',
    'assets/un_used_images/story1.png',
  ];
  List<String> storiesName = [
    'You ',
    'Selena',
    'Clara',
    'Fabian',
    'George',
    'Selena',
    'Fabian',
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListener();
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
    //showBottomSheetForChatting();
  }
  clickOnMessage() {
    showBottomSheetForChatting();
  }

  showBottomSheetForChatting() {
    double height = 600.px;
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * 0.85,
                child: Column(
                  children: [
                    ListTile(
                      leading: CommonWidgets.appIcons(
                          assetName: storiesImages[0],
                          width: 55.px,
                          height: 55.px,
                          fit: BoxFit.fill),
                      title: Text(
                        storiesName[0],
                        style: MyTextStyle.titleStyle13bb,
                      ),
                      subtitle: Text(
                        'Online',
                        style: MyTextStyle.titleStyle12b,
                      ),
                      /* trailing: Row(
                          children: [
                            CommonWidgets.appIcons(
                                assetName: storiesImages[0],
                                width: 25.px,
                                height: 25.px,
                                fit: BoxFit.fill),
                            SizedBox(
                              width: 5.px,
                            ),
                            CommonWidgets.appIcons(
                                assetName: storiesImages[0],
                                width: 25.px,
                                height: 25.px,
                                fit: BoxFit.fill)
                          ],
                        )*/
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.15,
                margin: EdgeInsets.only(
                  left: 10.px,
                  right: 10.px,
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child: CommonWidgets.commonTextFieldForLoginSignUP(
                            controller: searchController,
                            hintText: StringConstants.messages)),
                    Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.center,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.px),
                            ),
                            elevation: 5.px,
                            child: Container(
                              height: 50.px,
                              width: 50.px,
                              alignment: Alignment.center,
                              child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icVoice,
                                  height: 25.px,
                                  width: 25.px,
                                  fit: BoxFit.fill,
                                  borderRadius: 0.px),
                            ),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
