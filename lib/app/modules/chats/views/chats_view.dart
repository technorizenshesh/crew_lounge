import 'package:crew_lounge/app/data/apis/api_models/get_chat_user_model.dart';
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
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.px,
            ),
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
                  scrollDirection: Axis.vertical, child: showUserList()),
            )
          ],
        );
      }),
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

  Widget showUserList() {
    return controller.inAsyncCall.value
        ? CommonWidgets.customProgressBar(
            height: 350.px, inAsyncCall: controller.inAsyncCall.value)
        : Column(
            children: [
              ListView.builder(
                itemCount: controller.userList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(3.px),
                itemBuilder: (context, index) {
                  GetChatUserResult item = controller.userList[index];
                  return ListTile(
                    onTap: () {
                      controller.clickOnMessage(index);
                    },
                    leading: CommonWidgets.imageView(
                        image: item.image ?? '',
                        width: 55.px,
                        height: 55.px,
                        borderRadius: BorderRadius.circular(28.px),
                        defaultNetworkImage:
                            StringConstants.defaultNetworkImage,
                        fit: BoxFit.fill),
                    title: Text(
                      item.userName ?? '',
                      style: MyTextStyle.titleStyle13bb,
                    ),
                    subtitle: Text(
                      item.lastMessage ?? 'Typing...',
                      style: MyTextStyle.titleStyle12b,
                    ),
                    trailing: SizedBox(
                      height: 60.px,
                      width: 80.px,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.timeAgo ?? '',
                            style: MyTextStyle.titleStyle12b,
                          ),
                          item.noOfMessage != 0
                              ? Container(
                                  height: 18.px,
                                  width: 18.px,
                                  alignment: Alignment.center,
                                  decoration:
                                      CommonWidgets.kGradientBoxDecoration(
                                          showGradientBorder: true,
                                          borderRadius: 9.px),
                                  child: Text(
                                    item.noOfMessage.toString() ?? '0',
                                    style: MyTextStyle.titleStyle12w,
                                  ),
                                )
                              : SizedBox(
                                  height: 15.px,
                                )
                        ],
                      ),
                    ),
                  );
                },
              ),
              if (controller.userList.isEmpty) CommonWidgets.dataNotFound()
            ],
          );
  }
}
