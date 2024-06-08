import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          controller.count.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.px),
                  child: Text(
                    StringConstants.messages,
                    style: MyTextStyle.titleStyle30bb,
                  ),
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              GestureDetector(
                onTap: () {
                  controller.clickOnSearchIcon();
                },
                child: Container(
                  height: 50.px,
                  margin: EdgeInsets.only(left: 20.px, right: 20.px),
                  padding: EdgeInsets.all(1.5.px),
                  decoration: CommonWidgets.kGradientBoxDecoration(
                      borderRadius: 10.px, showGradientBorder: true),
                  child: Container(
                    padding: EdgeInsets.all(5.px),
                    decoration: BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.circular(9.px),
                    ),
                    child: Row(
                      children: [
                        CommonWidgets.appIcons(
                            assetName: IconConstants.icSearch,
                            width: 30.px,
                            height: 30.px,
                            fit: BoxFit.fill),
                        SizedBox(
                          width: 5.px,
                        ),
                        CommonWidgets.gradientText(StringConstants.search, 14)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.px,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.px),
                child: Text(
                  StringConstants.activities,
                  style: MyTextStyle.titleStyle18bb,
                ),
              ),
              Container(
                height: 100.px,
                padding: EdgeInsets.only(left: 15.px, right: 15.px),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: showActivities()),
              ),
              SizedBox(
                height: 10.px,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.px),
                child: Text(
                  StringConstants.messages,
                  style: MyTextStyle.titleStyle18bb,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical, child: showMessages()),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget showActivities() {
    return ListView.builder(
      itemCount: controller.storiesName.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(3.px),
      itemBuilder: (context, index) {
        //GetWalletListData item = myWalletList[index];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.appIcons(
                    assetName: controller.storiesImages[index],
                    width: 55.px,
                    height: 55.px,
                    fit: BoxFit.fill),
                SizedBox(
                  height: 3.px,
                ),
                Text(
                  controller.storiesName[index],
                  style: MyTextStyle.titleStyle13bb,
                )
              ],
            ));
      },
    );
  }

  Widget showMessages() {
    return ListView.builder(
      itemCount: controller.storiesName.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(3.px),
      itemBuilder: (context, index) {
        //GetWalletListData item = myWalletList[index];
        return ListTile(
          onTap: () {
            controller.clickOnMessage();
          },
          leading: CommonWidgets.appIcons(
              assetName: controller.storiesImages[index],
              width: 55.px,
              height: 55.px,
              fit: BoxFit.fill),
          title: Text(
            controller.storiesName[index],
            style: MyTextStyle.titleStyle13bb,
          ),
          subtitle: Text(
            'Typing...',
            style: MyTextStyle.titleStyle12b,
          ),
          trailing: Text(
            '20 min',
            style: MyTextStyle.titleStyle12b,
          ),
        );
      },
    );
  }
}
