import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(body: SafeArea(
        child: Obx(() {
          controller.count.value;
          return CommonWidgets.customProgressBar(
              inAsyncCall: controller.inAsyncCall.value,
              child: controller.inAsyncCall.value
                  ? const SizedBox()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icAddCircle,
                                  width: 25.px,
                                  height: 25.px,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(width: 15.px),
                            GestureDetector(
                              onTap: () {
                                controller.clickOnSetting();
                              },
                              child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icSetting,
                                  width: 25.px,
                                  height: 25.px,
                                  fit: BoxFit.fill),
                            ),
                            SizedBox(width: 20.px),
                          ],
                        ),
                        SizedBox(height: 10.px),
                        CommonWidgets.imageView(
                            image: controller.userData!.result!.image ?? '',
                            width: 130.px,
                            height: 130.px,
                            fit: BoxFit.fill,
                            defaultNetworkImage:
                                StringConstants.defaultNetworkImage,
                            borderRadius: BorderRadius.circular(65.px)),
                        SizedBox(height: 10.px),
                        Text(
                          controller.userData!.result!.userName ?? '',
                          style: MyTextStyle.titleStyle18bb,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          controller.userData!.result!.email ?? '',
                          style: MyTextStyle.titleStyle13b,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "500",
                                  style: MyTextStyle.titleStyle16bb,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 2.px),
                                Text(
                                  "Posts",
                                  style: MyTextStyle.titleStyle13b,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "60k",
                                  style: MyTextStyle.titleStyle16bb,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 2.px),
                                Text(
                                  "Followers",
                                  style: MyTextStyle.titleStyle13b,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "123",
                                  style: MyTextStyle.titleStyle16bb,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 2.px),
                                Text(
                                  "Following",
                                  style: MyTextStyle.titleStyle13b,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonWidgets.commonGradientButton(
                                  onPressed: () {
                                    controller.clickOnEditProfile();
                                  },
                                  child: Text(
                                    StringConstants.editProfile,
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  buttonMargin: EdgeInsets.only(
                                      left: 20.px, right: 20.px)),
                            ),
                            Expanded(
                              flex: 1,
                              child: CommonWidgets.commonGradientButton(
                                  onPressed: () {},
                                  child: Text(
                                    StringConstants.shareProfile,
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  buttonMargin: EdgeInsets.only(
                                      left: 20.px, right: 20.px)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.px),
                        Container(
                          height: 50.px,
                          child: TabBar(
                            labelColor: Colors.black,
                            indicatorColor: Colors.cyan,
                            indicatorWeight: 2.px,
                            dividerColor: Colors.grey.withOpacity(0.5),
                            // ignore: prefer_const_literals_to_create_immutables
                            tabs: [
                              Text(
                                StringConstants.posts,
                                style: MyTextStyle.titleStyle16bb,
                              ),
                              Text(
                                StringConstants.videos,
                                style: MyTextStyle.titleStyle16bb,
                              ),
                              Text(
                                StringConstants.events,
                                style: MyTextStyle.titleStyle16bb,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(children: [
                            MyTabOne(),
                            MyTabTwo(),
                            MyTabOne(),
                            // MyReelsTab(),
                            // MyTagTab(),
                          ]),
                        )
                      ],
                    ));
        }),
      )),
    );
  }
}

class MyTabOne extends StatelessWidget {
  const MyTabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
          child: CommonWidgets.appIcons(
              assetName: 'assets/un_used_images/post.png',
              height: 380.px,
              width: double.infinity)),
    );
  }
}

class MyTabTwo extends StatelessWidget {
  const MyTabTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
          child: CommonWidgets.appIcons(
              assetName: 'assets/un_used_images/post.png',
              height: 380.px,
              width: double.infinity)),
    );
  }
}
