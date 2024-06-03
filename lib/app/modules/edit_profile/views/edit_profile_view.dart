import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBar(
          title: StringConstants.editProfile,
        ),
        bottomNavigationBar: CommonWidgets.commonGradientButton(
            onPressed: () {},
            child: Text(
              StringConstants.update,
              style: MyTextStyle.titleStyle16bw,
            ),
            buttonMargin:
                EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px)),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(10.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.px),
                CommonWidgets.appIcons(
                    assetName: 'assets/un_used_images/story1.png',
                    width: 130.px,
                    height: 130.px,
                    fit: BoxFit.fill,
                    borderRadius: 65.px),
                SizedBox(height: 10.px),
                Text(
                  "James Donin",
                  style: MyTextStyle.titleStyle18bb,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "James Donin@petra.africa",
                  style: MyTextStyle.titleStyle13b,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusFullName,
                    hintText: StringConstants.fullName,
                    controller: controller.fullNameController,
                    isCard: controller.isFullName.value,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb),
                SizedBox(height: 10.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusEmail,
                    hintText: StringConstants.email,
                    controller: controller.emailController,
                    isCard: controller.isEmail.value,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb),
                SizedBox(height: 10.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusDob,
                    hintText: StringConstants.dob,
                    controller: controller.dobController,
                    isCard: controller.isDob.value,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb),
                SizedBox(height: 10.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusPhone,
                    hintText: StringConstants.mobileNumber,
                    controller: controller.phoneController,
                    isCard: controller.isPhone.value,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb),
                SizedBox(height: 10.px),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusGender,
                    hintText: StringConstants.gender,
                    controller: controller.genderController,
                    isCard: controller.isGender.value,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb)
              ],
            ),
          );
        }));
  }
}
