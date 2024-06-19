import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            extendBody: true,
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottomNavigationBar: CommonWidgets.commonGradientButton(
                onPressed: () {
                  controller.clickOnSaveButton();
                },
                child: Text(
                  StringConstants.submit,
                  style: MyTextStyle.titleStyle16bw,
                ),
                isLoading: controller.inAsyncCall.value,
                buttonMargin:
                    EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px)),
            appBar: CommonWidgets.appBar(title: StringConstants.changePassword),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.currentPasswordController,
                        isCard: controller.isCurrentPassword.value,
                        focusNode: controller.focusCurrentPassword,
                        obscureText: controller.currentPasswordHide.value,
                        hintText: StringConstants.currentPassword,
                        hintTextColor: controller.isCurrentPassword.value,
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnCurrentPasswordEyeButton(),
                          child: Icon(
                            controller.currentPasswordHide.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primary2Color,
                            size: 20.px,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.newPasswordController,
                        isCard: controller.isNewPassword.value,
                        focusNode: controller.focusNewPassword,
                        obscureText: controller.newPasswordHide.value,
                        hintText: StringConstants.newPassword,
                        hintTextColor: controller.isNewPassword.value,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.clickOnNewPasswordEyeButton(),
                          child: Icon(
                            controller.newPasswordHide.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primary2Color,
                            size: 20.px,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.confirmPasswordController,
                        isCard: controller.isConfirmPassword.value,
                        focusNode: controller.focusConfirmPassword,
                        obscureText: controller.confirmPasswordHide.value,
                        hintText: StringConstants.confirmPassword.tr,
                        hintTextColor: controller.isConfirmPassword.value,
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              controller.clickOnConfirmPasswordEyeButton(),
                          child: Icon(
                            controller.confirmPasswordHide.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primary2Color,
                            size: 20.px,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
