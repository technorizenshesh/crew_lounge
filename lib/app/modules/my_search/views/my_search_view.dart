import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_search_controller.dart';

class MySearchView extends GetView<MySearchController> {
  const MySearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
            wantBackButton: true, showColorBackButton: true, title: ''),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringConstants.searchHistory,
                              style: MyTextStyle.titleStyle18bb,
                            ),
                            InkWell(
                                onTap: () {
                                  //controller.submitDeleteSearchHistory();
                                },
                                child: Icon(Icons.delete_outline,
                                    size: 25.px, color: Colors.black54))
                          ],
                        ),
                        SizedBox(
                          height: 100.px,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: showSearchHistoryList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.topSearch,
                              style: MyTextStyle.titleStyle18bb,
                            ),
                            SizedBox(
                              width: 5.px,
                            ),
                            CommonWidgets.appIcons(
                                assetName: IconConstants.icFire,
                                height: 25.px,
                                width: 25.px,
                                fit: BoxFit.fill)
                          ],
                        ),
                        SizedBox(
                          height: 100.px,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: showTopSearchList(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.hotCircle,
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
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: showHotCircleList(),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          StringConstants.popularQA,
                          style: MyTextStyle.titleStyle18bb,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: showQuestionAnswer(),
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

  ///Show Search History List....
  Widget showSearchHistoryList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            // crossAxisCount: 2,
            childAspectRatio: 150 / 50,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            maxCrossAxisExtent: 150),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.searchHistory.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            elevation: 0,
            color: primary3Color,
            child: Container(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  controller.searchHistory[index],
                  style: MyTextStyle.titleStyle16b,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
  }

  ///Show Top Search List....
  Widget showTopSearchList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 150 / 50,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            maxCrossAxisExtent: 150),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            elevation: 0,
            color: primary3Color,
            child: Container(
              padding: const EdgeInsets.all(3),
              child: Center(
                child: Text(
                  'Smith',
                  style: MyTextStyle.titleStyle16b,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        });
  }

  ///Hot Circle List....
  Widget showHotCircleList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.hotCircle.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
            onTap: () {},
            child: Container(
              width: 100,
              height: 100,
              color: primary3Color,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
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
                  Center(
                      child: Text(
                    controller.searchHistory[index],
                    style: MyTextStyle.titleStyle13b,
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
            ));
      },
    );
  }

  /// Show Popular Question and Answer...
  Widget showQuestionAnswer() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.none,
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          elevation: 0,
          color: primary3Color,
          child: Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.question_answer,
                          size: 15,
                        )),
                    Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              removeAllHtmlTags(controller.testQuestion),
                              style: MyTextStyle.titleStyle13b,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "132 to answer",
                              style: MyTextStyle.titleStyle10b,
                            )
                          ],
                        )),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
