import 'package:crew_lounge/app/data/constants/image_constants.dart';
import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          controller.count.value;
          return Column(
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
                    height: MediaQuery.of(context).size.height - 180.px,
                    padding: EdgeInsets.only(
                        left: 30.px, right: 30.px, top: 30.px, bottom: 20.px),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.px),
                            topRight: Radius.circular(40.px))),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringConstants.login,
                            style: MyTextStyle.titleStyle24bb,
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          Text(
                            StringConstants.enterYourEmailAndPassword,
                            style: MyTextStyle.titleStyle16gr,
                          ),
                          SizedBox(
                            height: 30.px,
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
                                  assetName: IconConstants.icEmail)),
                          SizedBox(
                            height: 15.px,
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
                                  assetName: IconConstants.icLock)),
                          SizedBox(
                            height: 25.px,
                          ),
                          InkWell(
                            onTap: () {
                              controller.clickOnForgotPasswordButton();
                            },
                            child: Column(
                              children: [
                                CommonWidgets.gradientText(
                                  StringConstants.forgotYourPassword,
                                  14,
                                ),
                                Divider(
                                  color: Colors.pink,
                                  height: 1.px,
                                  thickness: 1.px,
                                  endIndent: 75.px,
                                  indent: 75.px,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.px,
                          ),
                          CommonWidgets.commonElevatedButton(
                              onPressed: () {
                                controller.clickOnLoginButton();
                              },
                              child: Text(
                                StringConstants.login,
                                style: MyTextStyle.titleStyle18bw,
                              ),
                              borderRadius: 30.px,
                              buttonColor: primaryColor,
                              showLoading: controller.showLoading.value),
                          SizedBox(
                            height: 15.px,
                          ),
                          InkWell(
                            onTap: () {
                              controller.clickOnSignUpButton();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  StringConstants.dotHaveAnAccount,
                                  style: MyTextStyle.titleStyle16b,
                                ),
                                SizedBox(
                                  width: 5.px,
                                ),
                                CommonWidgets.gradientText(
                                    StringConstants.signUp, 16.px)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              StringConstants.or,
                              style: MyTextStyle.titleStyle16bb,
                            ),
                          ),
                          SizedBox(
                            height: 30.px,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CommonWidgets.appIcons(
                                  assetName: IconConstants.icGoogle,
                                  height: 30.px,
                                  width: 30.px),
                              SizedBox(
                                width: 10.px,
                              ),
                              Text(
                                StringConstants.signInWithGoogle,
                                style: MyTextStyle.titleStyle16bb,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }));
  }
}
