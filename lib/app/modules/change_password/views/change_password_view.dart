import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_methods.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      if (controller
                              .confirmPasswordController.text.isNotEmpty &&
                          controller.newPasswordController.text.isNotEmpty &&
                          controller
                              .currentPasswordController.text.isNotEmpty) {
                        if (controller.newPasswordController.text ==
                            controller.confirmPasswordController.text) {
                          controller.clickOnSaveButton();
                        } else {
                          CommonWidgets.snackBarView(
                              title:
                                  'New Password and confirm password are not match.');
                        }
                      } else {
                        CommonWidgets.snackBarView(
                            title: StringConstants.allFieldsRequired);
                      }
                    },
                    child: Text(
                      StringConstants.save.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
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
                          onTap: () => controller.clickOnPasswordEyeButton(),
                          child: Icon(
                            controller.passwordHide.value
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
                          onTap: () => controller.clickOnPasswordEyeButton(),
                          child: Icon(
                            controller.passwordHide.value
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
                          onTap: () => controller.clickOnPasswordEyeButton(),
                          child: Icon(
                            controller.passwordHide.value
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
