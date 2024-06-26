import 'package:crew_lounge/app/data/constants/image_constants.dart';
import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/custom_triangle.dart';
import '../controllers/terms_condition_controller.dart';

class TermsConditionView extends GetView<TermsConditionController> {
  const TermsConditionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.termsAndCondition),
        body: Obx(() {
          controller.count.value;
          return Column(
            children: [
              SizedBox(
                height: 20.px,
              ),
              CommonWidgets.appIcons(
                  assetName: ImageConstants.imgTermsCondition,
                  width: 175.px,
                  height: 175.px,
                  fit: BoxFit.fill),
              Padding(
                padding: EdgeInsets.all(20.px),
                child: Text(
                  StringConstants.test,
                  style: MyTextStyle.titleStyle13b,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      painter: CustomTriangle(showRightSide: false),
                      size: const Size(15, 25),
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      color: Colors.blue,
                    ),
                    CustomPaint(
                      painter: CustomTriangle(showRightSide: true),
                      size: const Size(15, 25),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}
