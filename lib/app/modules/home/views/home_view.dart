import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_posts_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: AppBar(
          leadingWidth: 180.px,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.px),
            child: CommonWidgets.appIcons(
                assetName: IconConstants.icLogoName,
                width: 180.px,
                height: 40.px,
                fit: BoxFit.fill),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                controller.clickOnSearchIcon();
              },
              child: CommonWidgets.appIcons(
                  assetName: IconConstants.icSearch,
                  width: 48.px,
                  height: 48.px,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 10.px,
            ),
            GestureDetector(
              onTap: () {
                controller.clickOnNotificationIcon();
              },
              child: CommonWidgets.appIcons(
                  assetName: IconConstants.icNotification,
                  width: 48.px,
                  height: 48.px,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              width: 10.px,
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
                height: 130.px,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, child: showStories())),
            controller.inAsyncCall.value
                ? Container(
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px)),
                    clipBehavior: Clip.hardEdge,
                    child: CommonWidgets.customProgressBar(
                      height: MediaQuery.of(context).size.height * 0.58,
                      inAsyncCall: controller.inAsyncCall.value,
                    ),
                  )
                : cardView(context)
          ],
        ),
      );
    });
  }

  Widget showStories() {
    return ListView.builder(
      itemCount: controller.storiesName.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10.px),
      itemBuilder: (context, index) {
        //GetWalletListData item = myWalletList[index];
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.appIcons(
                    assetName: controller.storiesImages[index],
                    width: 65.px,
                    height: 65.px,
                    fit: BoxFit.fill),
                SizedBox(
                  height: 5.px,
                ),
                Text(
                  controller.storiesName[index],
                  style: MyTextStyle.titleStyle14b,
                )
              ],
            ));
      },
    );
  }

  Widget cardView(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.58,
        width: double.infinity,
        margin: EdgeInsets.only(left: 20.px, right: 20.px),
        padding: EdgeInsets.all(1.px),
        decoration: CommonWidgets.kGradientBoxDecoration(
            borderRadius: 10.px, showGradientBorder: true),
        clipBehavior: Clip.hardEdge,
        child: SwipeCards(
          itemBuilder: (BuildContext context, int index) {
            GetPostResult item = controller.postList[index];
            return Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CommonWidgets.imageView(
                        image: item.image ?? '',
                        height: MediaQuery.of(context).size.height * 0.58,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        defaultNetworkImage:
                            StringConstants.defaultNetworkImage)),
                Positioned(
                    top: 20.px,
                    right: 20.px,
                    child: GestureDetector(
                      child: CommonWidgets.appIcons(
                          assetName: IconConstants.icReport,
                          height: 40.px,
                          width: 40.px,
                          fit: BoxFit.fill),
                    )),
                Positioned(
                    bottom: 0.px,
                    child: Container(
                      height: 110.px,
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.only(left: 5.px, right: 5.px, top: 5.px),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.px),
                              bottomRight: Radius.circular(10.px))),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 70.px,
                                    width: 70.px,
                                    child: CommonWidgets.imageView(
                                        image: item.userImage ?? '',
                                        height: 70.px,
                                        width: 70.px,
                                        fit: BoxFit.fill,
                                        defaultNetworkImage:
                                            StringConstants.defaultNetworkImage,
                                        borderRadius:
                                            BorderRadius.circular(35.px)),
                                  ),
                                  Positioned(
                                      right: 5.px,
                                      bottom: 5.px,
                                      child: Container(
                                        height: 10.px,
                                        width: 10.px,
                                        decoration: BoxDecoration(
                                            color: item.onlineStatus == 'ONLINE'
                                                ? Colors.green
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5.px)),
                                      ))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.userName ?? '',
                                    style: MyTextStyle.titleStyle24bw,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${item.distance} km away',
                                    style: MyTextStyle.titleStyle16w,
                                    maxLines: 1,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 20.px,
                                width: 200.px,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 50.px),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.clickOnChatIcon(index);
                                  },
                                  child: CommonWidgets.appIcons(
                                      assetName: IconConstants.icMessage,
                                      height: 30.px,
                                      width: 30.px,
                                      fit: BoxFit.fill,
                                      borderRadius: 0.px),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            );
          },
          onStackFinished: () {
            CommonWidgets.showMyToastMessage("Stack Finished");
            controller.inAsyncCall.value = true;
            controller.onInit();
          },
          matchEngine: controller.matchEngine,
        ));
  }
}
