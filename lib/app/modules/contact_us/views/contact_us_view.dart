import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CommonWidgets.appBar(title: StringConstants.contactUs),
          bottomNavigationBar: CommonWidgets.commonGradientButton(
              onPressed: () {
                controller.submitMessage();
              },
              child: Text(
                StringConstants.submit,
                style: MyTextStyle.titleStyle16bw,
              ),
              isLoading: controller.inAsyncCall.value,
              buttonMargin:
                  EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px)),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  CommonWidgets.appIcons(
                      assetName: ImageConstants.imgContactUs,
                      height: 180.px,
                      width: double.infinity,
                      fit: BoxFit.fill),
                  SizedBox(
                    height: 10.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusName,
                      controller: controller.nameController,
                      isCard: controller.isName.value,
                      hintText: StringConstants.fullName,
                      hintStyle: MyTextStyle.titleStyle14b,
                      style: MyTextStyle.titleStyle14bb,
                      keyboardType: TextInputType.name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 20.px,
                      )),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusEmail,
                      controller: controller.emailController,
                      isCard: controller.isEmail.value,
                      hintText: StringConstants.email,
                      hintStyle: MyTextStyle.titleStyle14b,
                      style: MyTextStyle.titleStyle14bb,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                        size: 20.px,
                      )),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusMessage,
                    controller: controller.messageController,
                    isCard: controller.isMessage.value,
                    hintText: StringConstants.message,
                    hintStyle: MyTextStyle.titleStyle14b,
                    style: MyTextStyle.titleStyle14bb,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
