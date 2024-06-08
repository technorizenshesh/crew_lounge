import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/close_friends_controller.dart';

class CloseFriendsView extends GetView<CloseFriendsController> {
  const CloseFriendsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
            wantBackButton: true,
            showColorBackButton: true,
            title: StringConstants.closeFriends),
        body: Obx(() {
          controller.count.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.px, right: 20.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.searchController,
                  isCard: true,
                  hintText: StringConstants.search,
                  hintStyle: MyTextStyle.titleStyle14b,
                  style: MyTextStyle.titleStyle14bb,
                  keyboardType: TextInputType.emailAddress,
                  borderRadius: 10.px,
                  prefixIcon: CommonWidgets.appIcons(
                      assetName: IconConstants.icSearch,
                      width: 30.px,
                      height: 30.px,
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20.px, right: 20.px, top: 5.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.closeFriends,
                              style: MyTextStyle.titleStyle18bb,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  StringConstants.seeMore,
                                  style: MyTextStyle.titleStyle12bb,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 300,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: showHotCircleList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringConstants.friends,
                          style: MyTextStyle.titleStyle18bb,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: showHotCircleList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }

  ///Hot Circle List....
  Widget showHotCircleList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.hotCircle.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
            onTap: () {},
            child: Container(
              height: 80,
              color: primary3Color,
              child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Image.network(
                      controller.hotCircle[index],
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          IconConstants.icGoogle,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  title: Text(
                    controller.searchHistory[index],
                    style: MyTextStyle.titleStyle16bb,
                  ),
                  subtitle: Text(
                    StringConstants.friends,
                    style: MyTextStyle.titleStyle13b,
                  )),
            ));
      },
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
