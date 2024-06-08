import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: controller.body(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.px, vertical: 8.px),
                      child: GNav(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 4.px),
                        tabs: [
                          button(
                              selectImage: IconConstants.icHomeColor,
                              image: IconConstants.icHome,
                              text: StringConstants.home,
                              index: 0),
                          button(
                              selectImage: IconConstants.icFriendsColor,
                              image: IconConstants.icFriends,
                              text: StringConstants.friends,
                              index: 1),
                          button(
                              selectImage: IconConstants.icChat,
                              image: IconConstants.icChat,
                              text: '',
                              index: 2),
                          button(
                              selectImage: IconConstants.icNavChatColor,
                              image: IconConstants.icNavChat,
                              text: StringConstants.chats,
                              index: 3),
                          button(
                              selectImage: IconConstants.icProfileColor,
                              image: IconConstants.icProfile,
                              text: StringConstants.profile,
                              index: 4),
                        ],
                        selectedIndex: selectedIndex.value,
                        onTabChange: (index) {
                          selectedIndex.value = index;
                          controller.increment();
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50.px),
                    child: GestureDetector(
                      onTap: () {
                        selectedIndex.value = 2;
                        controller.increment();
                      },
                      child: CommonWidgets.appIcons(
                        width: 52.px,
                        height: 52.px,
                        assetName: IconConstants.icNavAdd,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  button(
      {required String selectImage,
      required String image,
      required String text,
      required int index}) {
    return GButton(
      icon: Icons.add,
      leading: Column(
        children: [
          CommonWidgets.appIcons(
              assetName: selectedIndex.value == index ? selectImage : image,
              width: 24.px,
              height: 24.px,
              fit: BoxFit.fill),
          selectedIndex.value == index
              ? CommonWidgets.gradientText(text, 12)
              : Text(
                  text,
                  style: MyTextStyle.titleStyle12b,
                )
        ],
      ),
    );
  }
}
