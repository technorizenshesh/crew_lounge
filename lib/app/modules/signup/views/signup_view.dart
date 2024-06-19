import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 230.px,
                      child: CommonWidgets.appIcons(
                          assetName: ImageConstants.imgLoginBackground,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          borderRadius: 0.px,
                          height: 230.px),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 180.px),
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height - 210.px,
                      padding: EdgeInsets.only(
                          left: 20.px, right: 20.px, top: 30.px, bottom: 20.px),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.px),
                              topRight: Radius.circular(40.px))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.signUp,
                            style: MyTextStyle.titleStyle24bb,
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          Text(
                            StringConstants.letsGetStartedByCreatingYourAccount,
                            style: MyTextStyle.titleStyle16gr,
                          ),
                          SizedBox(
                            height: 30.px,
                          ),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusFullName,
                              controller: controller.fullNameController,
                              isCard: controller.isFullName.value,
                              hintText: StringConstants.fullName,
                              hintStyle: MyTextStyle.titleStyle14b,
                              style: MyTextStyle.titleStyle14bb,
                              keyboardType: TextInputType.name,
                              borderRadius: 30.px,
                              prefixIcon: CommonWidgets.appIcons(
                                  assetName: IconConstants.icProfile,
                                  width: 20.px,
                                  height: 20.px,
                                  fit: BoxFit.fill)),
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusEmail,
                              controller: controller.emailController,
                              isCard: controller.isEmail.value,
                              hintText:
                                  StringConstants.emailAddressMobileNumber,
                              hintStyle: MyTextStyle.titleStyle14b,
                              style: MyTextStyle.titleStyle14bb,
                              keyboardType: TextInputType.emailAddress,
                              borderRadius: 30.px,
                              prefixIcon: CommonWidgets.appIcons(
                                  assetName: IconConstants.icEmail,
                                  width: 20.px,
                                  height: 20.px,
                                  fit: BoxFit.fill)),
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            focusNode: controller.focusMobile,
                            controller: controller.mobileController,
                            isCard: controller.isMobile.value,
                            hintText: StringConstants.mobileNumber,
                            hintStyle: MyTextStyle.titleStyle14b,
                            style: MyTextStyle.titleStyle14bb,
                            keyboardType: TextInputType.number,
                            borderRadius: 30.px,
                            horizontalPadding: 0,
                            prefixIconHorizontal: 8,
                            prefixIcon: CommonWidgets.countryCodePicker(
                                onChanged: (value) =>
                                    controller.clickOnCountryCode(value: value),
                                initialSelection:
                                    controller.countryDailCode.value),
                          ),
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusDob,
                              controller: controller.dobController,
                              isCard: controller.isDob.value,
                              hintText: StringConstants.dob,
                              hintStyle: MyTextStyle.titleStyle14b,
                              style: MyTextStyle.titleStyle14bb,
                              readOnly: true,
                              keyboardType: TextInputType.datetime,
                              borderRadius: 30.px,
                              prefixIcon: Icon(
                                Icons.date_range,
                                size: 20.px,
                                color: Colors.black45,
                              ),
                              onTap: () {
                                controller.clickOnDate();
                              }),
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.commonTextFieldForLoginSignUP(
                              obscureText: controller.passwordHide.value,
                              focusNode: controller.focusPassword,
                              controller: controller.passwordController,
                              isCard: controller.isPassword.value,
                              hintText: StringConstants.password,
                              hintStyle: MyTextStyle.titleStyle14b,
                              style: MyTextStyle.titleStyle14bb,
                              keyboardType: TextInputType.visiblePassword,
                              borderRadius: 30.px,
                              suffixIcon: GestureDetector(
                                onTap: () =>
                                    controller.clickOnPasswordEyeButton(),
                                child: Icon(
                                  controller.passwordHide.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: primary2Color,
                                  size: 20.px,
                                ),
                              ),
                              prefixIcon: CommonWidgets.appIcons(
                                  assetName: IconConstants.icLock,
                                  width: 20.px,
                                  height: 20.px,
                                  fit: BoxFit.fill)),
                          SizedBox(
                            height: 25.px,
                          ),
                          InkWell(
                            onTap: () {
                              controller.changeCheckBox();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: controller.checkBox.value
                                        ? Icon(
                                            Icons.check_circle,
                                            size: 25.px,
                                            color: Colors.pinkAccent,
                                          )
                                        : Icon(
                                            Icons.circle_outlined,
                                            size: 25.px,
                                            color: Colors.pinkAccent,
                                          )),
                                Expanded(
                                  flex: 5,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            StringConstants.iAgreeToTheMedidoc,
                                            style: MyTextStyle.titleStyle14b,
                                          ),
                                          SizedBox(
                                            width: 5.px,
                                          ),
                                          CommonWidgets.gradientText(
                                            StringConstants.termsOfService,
                                            14,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            StringConstants.and,
                                            style: MyTextStyle.titleStyle14b,
                                          ),
                                          SizedBox(
                                            width: 5.px,
                                          ),
                                          CommonWidgets.gradientText(
                                            StringConstants.privacyPolicy,
                                            14,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.px,
                          ),
                          CommonWidgets.commonElevatedButton(
                              onPressed: () {
                                controller.getCurrentPosition();
                              },
                              child: Text(
                                StringConstants.signUp,
                                style: MyTextStyle.titleStyle18bw,
                              ),
                              borderRadius: 30.px,
                              buttonColor: primaryColor,
                              showLoading: controller.showLoading.value),
                          SizedBox(
                            height: 20.px,
                          ),
                          InkWell(
                            onTap: () {
                              controller.clickOnLoginButton();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  StringConstants.alreadyRegistered,
                                  style: MyTextStyle.titleStyle16b,
                                ),
                                SizedBox(
                                  width: 5.px,
                                ),
                                CommonWidgets.gradientText(
                                    StringConstants.login, 16.px)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.px,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
