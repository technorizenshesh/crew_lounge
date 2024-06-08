import 'package:crew_lounge/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_my_posts_model.dart';
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
                            width: 100.px,
                            height: 100.px,
                            fit: BoxFit.fill,
                            defaultNetworkImage:
                                StringConstants.defaultNetworkImage,
                            borderRadius: BorderRadius.circular(50.px)),
                        SizedBox(height: 5.px),
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
                        SizedBox(height: 5.px),
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
                        SizedBox(height: 5.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonWidgets.commonGradientButton(
                                  height: 40.px,
                                  wantContentSizeButton: true,
                                  onPressed: () {
                                    controller.clickOnEditProfile();
                                  },
                                  child: Text(
                                    StringConstants.editProfile,
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  buttonMargin: EdgeInsets.only(
                                      left: 30.px, right: 20.px)),
                            ),
                            Expanded(
                              flex: 1,
                              child: CommonWidgets.commonGradientButton(
                                  height: 40.px,
                                  wantContentSizeButton: true,
                                  onPressed: () {},
                                  child: Text(
                                    StringConstants.shareProfile,
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  buttonMargin: EdgeInsets.only(
                                      left: 20.px, right: 30.px)),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.px),
                        SizedBox(
                          height: 40.px,
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
                            MyTabOne(controller: controller),
                            MyTabTwo(),
                            MyTabOne(controller: controller),
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
  final ProfileController controller;
  const MyTabOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: controller.imagePostList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.imagePostList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, int index) {
                  GetMyPostResult item = controller.imagePostList[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.px),
                    ),
                    color: primary3Color,
                    elevation: 2.px,
                    clipBehavior: Clip.hardEdge,
                    margin: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CommonWidgets.imageView(
                              image: item.userImage ?? '',
                              height: 60.px,
                              width: 60.px,
                              borderRadius: BorderRadius.circular(30.px),
                              defaultNetworkImage:
                                  StringConstants.defaultNetworkImage),
                          title: Text(
                            item.userName ?? '',
                            style: MyTextStyle.titleStyle16bb,
                          ),
                          subtitle: Text(
                            item.userName ?? '',
                            style: MyTextStyle.titleStyle12b,
                          ),
                        ),
                        Stack(
                          children: [
                            CommonWidgets.imageView(
                                image: item.image ?? '',
                                height: 200.px,
                                width: double.infinity,
                                defaultNetworkImage:
                                    StringConstants.defaultNetworkImage),
                            Positioned(
                                top: 30.px,
                                right: 5.px,
                                child: SizedBox(
                                  width: 50.px,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: CommonWidgets.appIcons(
                                            assetName: IconConstants.icLike,
                                            height: 40.px,
                                            width: 40.px),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: CommonWidgets.appIcons(
                                            assetName: IconConstants.icComment,
                                            height: 40.px,
                                            width: 40.px),
                                      ),
                                      SizedBox(
                                        height: 10.px,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: CommonWidgets.appIcons(
                                            assetName: IconConstants.icThreeDot,
                                            height: 40.px,
                                            width: 40.px),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ],
                    ),
                  );
                })
            : CommonWidgets.dataNotFound());
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
