import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
            wantBackButton: true, showColorBackButton: true),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnSaveButton();
            },
            child: Text(
              StringConstants.save,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonMargin:
                EdgeInsets.only(bottom: 10.px, left: 20.px, right: 20.px),
            buttonColor: primaryColor),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.px,
                ),
                Text(StringConstants.createNewPassword,
                    style: MyTextStyle.titleStyle24bb),
                SizedBox(
                  height: 5.px,
                ),
                Text(
                  StringConstants.yourNewPasswordMustBeDifferentFromPrevious,
                  style: MyTextStyle.titleStyle14gr,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 20.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: controller.passwordHide.value,
                    focusNode: controller.focusNewPassword,
                    controller: controller.newPasswordController,
                    isCard: controller.isNewPassword.value,
                    hintText: StringConstants.newPassword,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb,
                    keyboardType: TextInputType.visiblePassword,
                    borderRadius: 30.px,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnPasswordEyeButton(),
                      child: Icon(
                        controller.passwordHide.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primary2Color,
                        size: 20.px,
                      ),
                    ),
                    prefixIcon: CommonWidgets.appIcons(
                        assetName: IconConstants.icLock)),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: controller.passwordHide.value,
                    focusNode: controller.focusCnfPassword,
                    controller: controller.cnfPasswordController,
                    isCard: controller.isCnfPassword.value,
                    hintText: StringConstants.confirmPassword,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb,
                    keyboardType: TextInputType.visiblePassword,
                    borderRadius: 30.px,
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnPasswordEyeButton(),
                      child: Icon(
                        controller.passwordHide.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: primary2Color,
                        size: 20.px,
                      ),
                    ),
                    prefixIcon: CommonWidgets.appIcons(
                        assetName: IconConstants.icLock)),
                SizedBox(
                  height: 20.px,
                ),
              ],
            ),
          );
        }));
  }
}
