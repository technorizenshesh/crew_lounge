import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../../common/common_widgets.dart';
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
                  scrollDirection: Axis.horizontal, child: showStories()),
            ),
            cardView(),
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

  Widget cardView() {
    return Container(
        height: 430.px,
        width: double.infinity,
        margin: EdgeInsets.only(left: 20.px, right: 20.px),
        child: SwipeCards(
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      controller.images[index],
                      height: 430.px,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )),
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
                    top: 320.px,
                    child: Container(
                      height: 110.px,
                      padding: EdgeInsets.only(left: 5.px, right: 5.px),
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 70.px,
                                width: 70.px,
                                child: CommonWidgets.appIcons(
                                    assetName:
                                        'assets/un_used_images/story1.png',
                                    height: 70.px,
                                    width: 70.px,
                                    fit: BoxFit.fill,
                                    borderRadius: 35.px),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Anna Mcconaughey ghhjjkjjs',
                                    style: MyTextStyle.titleStyle24bw,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '1.5 km away',
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
                              CommonWidgets.appIcons(
                                  assetName: IconConstants.icMessage,
                                  height: 30.px,
                                  width: 30.px,
                                  fit: BoxFit.fill,
                                  borderRadius: 0.px),
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
          },
          matchEngine: controller.matchEngine,
        ));
  }
}
