import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        controller.count.value;
        return Column(
          children: [
            SizedBox(
              height: 30.px,
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              title: Padding(
                padding: EdgeInsets.only(left: 60.px),
                child: Text(
                  StringConstants.post,
                  style: MyTextStyle.titleStyle20bb,
                  textAlign: TextAlign.center,
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    controller.openNewPostPage(
                        controller.path[controller.selectedImgIndex.value]);
                  },
                  child:
                      CommonWidgets.gradientText(StringConstants.next, 17.px)),
            ),
            SizedBox(
              height: 10.px,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.px))),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(left: 15.px, right: 15.px),
              elevation: 5.px,
              child: SizedBox(
                height: 280.px,
                child: Obx(() => controller.progressBar.value
                    ? Container(
                        color: Colors.grey.withOpacity(0.1),
                      )
                    : controller.mediaList[controller.selectedImgIndex.value]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 10.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(StringConstants.gallery,
                          style: MyTextStyle.titleStyle16bb),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 25.px,
                        color: Colors.black,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            size: 25.px,
                            color: Colors.black,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.dashboard,
                            size: 25.px,
                            color: Colors.black,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 15.px, right: 15.px),
                  child: showRecentImages()),
            ),
          ],
        );
      }),
    );
  }

  Widget showRecentImages() {
    return GridView.builder(
        // controller: widget.scrollCtr,
        itemCount: controller.mediaList.length,
        padding: EdgeInsets.only(left: 2.px, right: 2.px, top: 1.px),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              controller.changeSelected(index);
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.px)),
                ),
                color: primary3Color,
                elevation: 5.px,
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(5.px),
                child: Stack(
                  children: [
                    controller.mediaList[index],
                    Positioned(
                        top: 5,
                        right: 5,
                        child: Obx(() => Container(
                              width: 15.px,
                              height: 15.px,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.5.px),
                                  color:
                                      controller.selectedImgIndex.value == index
                                          ? Colors.pink
                                          : primary3Color),
                            )))
                  ],
                )
                //child: _mediaList[index]
                ),
          );
        });
  }
}
