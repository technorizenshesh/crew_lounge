import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
            wantBackButton: true, showColorBackButton: true),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnSubmitButton();
            },
            child: Text(
              StringConstants.submit,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            showLoading: controller.showLoading.value,
            buttonMargin:
                EdgeInsets.only(bottom: 10.px, left: 20.px, right: 20.px),
            buttonColor: primaryColor),
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  Text(StringConstants.checkYourMailOrCheckYourCellPhone,
                      style: MyTextStyle.titleStyle24bb),
                  SizedBox(
                    height: 5.px,
                  ),
                  Text(
                    StringConstants.pleasePutThe4DigitsSentToYou,
                    style: MyTextStyle.titleStyle14gr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                  CommonWidgets.commonOtpView(controller: controller.pin),
                  SizedBox(
                    height: 20.px,
                  ),
                  CommonWidgets.appIcons(
                    assetName: ImageConstants.imgOtpBanner,
                    width: double.infinity,
                    height: 260.px,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 50.px,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
