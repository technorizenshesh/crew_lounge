import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/new_post_controller.dart';

class NewPostView extends GetView<NewPostController> {
  const NewPostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBar(
          wantBackButton: true,
          showColorBackButton: true,
          title: StringConstants.newPost),
      body: Column(
        children: [
          SizedBox(
            height: 20.px,
          ),
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.px))),
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(left: 15.px, right: 15.px),
              elevation: 2.px,
              child: SizedBox(
                height: 290.px,
                width: double.infinity,
                child: Image.file(
                  controller.imageFile,
                  fit: BoxFit.fill,
                ),
                // child: Image.file(File(controller.parameter['img_file']!),fit: BoxFit.fill,)
              )),
          SizedBox(
            height: 20.px,
          ),
          Padding(
            padding: EdgeInsets.all(10.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60.px,
                  height: 60.px,
                  margin: EdgeInsets.only(right: 5.px),
                  child: CommonWidgets.appIcons(
                      assetName: 'assets/un_used_images/story1.png',
                      width: 60.px,
                      height: 60.px,
                      borderRadius: 30.px,
                      fit: BoxFit.fill),
                ),
                Expanded(
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                        hintText: StringConstants.writeACaption,
                        controller: controller.captionController,
                        isCard: controller.isCaption.value,
                        hintStyle: MyTextStyle.titleStyle14b,
                        style: MyTextStyle.titleStyle14bb))
              ],
            ),
          ),
          SizedBox(
            height: 50.px,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonWidgets.appIcons(
                  assetName: IconConstants.icLocation,
                  width: 25.px,
                  height: 25.px,
                  fit: BoxFit.fill),
              SizedBox(
                width: 5.px,
              ),
              CommonWidgets.gradientText(StringConstants.addLocation, 16.px)
            ],
          )
        ],
      ),
    );
  }
}
