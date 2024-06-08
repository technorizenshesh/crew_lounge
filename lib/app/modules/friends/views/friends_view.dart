import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../../data/constants/icons_constant.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  const FriendsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.px),
                child: Text(
                  StringConstants.friends,
                  style: MyTextStyle.titleStyle30bb,
                ),
              ),
            ),
            SizedBox(
              height: 20.px,
            ),
            cardView(),
          ],
        ),
      ),
    );
  }

  Widget cardView() {
    return Container(
        height: 500.px,
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
                      height: 500.px,
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
                    top: 390.px,
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
