import 'package:crew_lounge/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  const PasswordResetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          appBar: CommonWidgets.appBar(
              wantBackButton: true, showColorBackButton: true),
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CommonWidgets.commonElevatedButton(
              onPressed: () {
                controller.clickOnSubmitButton();
              },
              child: Text(
                StringConstants.submit,
                style: MyTextStyle.titleStyle16bw,
              ),
              showLoading: controller.showLoading.value,
              borderRadius: 30.px,
              buttonMargin:
                  EdgeInsets.only(bottom: 10.px, left: 20.px, right: 20.px),
              buttonColor: primaryColor),
          body: SingleChildScrollView(
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
                  Text(StringConstants.passwordReset,
                      style: MyTextStyle.titleStyle24bb),
                  SizedBox(
                    height: 5.px,
                  ),
                  Text(
                    StringConstants
                        .pleasePutYourMobileNumberToResetYourPassword,
                    style: MyTextStyle.titleStyle14gr,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                  Container(
                    height: 100.px,
                    width: double.infinity,
                    decoration: CommonWidgets.kGradientBoxDecoration(
                        borderRadius: 20.px,
                        showGradientBorder: controller.isPhone.value),
                    child: Container(
                      margin: EdgeInsets.all(1.5.px),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19.px),
                      ),
                      child: ListTile(
                          leading: CommonWidgets.appIcons(
                            assetName: IconConstants.icChat,
                            height: 55.px,
                            width: 55.px,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            StringConstants.sms,
                            style: MyTextStyle.titleStyle16bb,
                          ),
                          subtitle: CommonWidgets.commonTextField(
                              focusNode: controller.focusPhone,
                              controller: controller.phoneController,
                              hintText: StringConstants.hintNumber,
                              hintStyle: MyTextStyle.titleStyle16b,
                              style: MyTextStyle.titleStyle16bb,
                              keyboardType: TextInputType.phone,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.px, vertical: 3.px))),
                    ),
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  Container(
                    height: 100.px,
                    decoration: CommonWidgets.kGradientBoxDecoration(
                        borderRadius: 20.px,
                        showGradientBorder: controller.isEmail.value),
                    width: double.infinity,
                    child: Container(
                      margin: EdgeInsets.all(1.5.px),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19.px),
                      ),
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.px, horizontal: 10.px),
                          leading: CommonWidgets.appIcons(
                            assetName: IconConstants.icEmailBox,
                            height: 55.px,
                            width: 55.px,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            StringConstants.email,
                            style: MyTextStyle.titleStyle16bb,
                          ),
                          subtitle: CommonWidgets.commonTextField(
                              focusNode: controller.focusEmail,
                              controller: controller.emailController,
                              hintText: StringConstants.hintEmail,
                              hintStyle: MyTextStyle.titleStyle16b,
                              style: MyTextStyle.titleStyle16bb,
                              keyboardType: TextInputType.emailAddress,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.px, vertical: 3.px))),
                    ),
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                  CommonWidgets.appIcons(
                    assetName: ImageConstants.imgResetPassword,
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
          ));
    });
  }
}
