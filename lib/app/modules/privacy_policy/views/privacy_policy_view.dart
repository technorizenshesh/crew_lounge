import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.privacyPolicy),
        body: Obx(() {
          controller.count.value;
          return Column(
            children: [
              SizedBox(
                height: 20.px,
              ),
              CommonWidgets.appIcons(
                  assetName: ImageConstants.imgPrivacyPolicy,
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
            ],
          );
        }));
  }
}
