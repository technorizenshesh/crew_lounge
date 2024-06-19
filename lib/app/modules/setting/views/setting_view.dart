import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
          title: StringConstants.setting,
        ),
        body: Obx(() {
          controller.count.value;
          return Column(
            children: [
              ListTile(
                onTap: () {
                  controller.openNewPage(0);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icCloseFriends,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.closeFriends,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(1);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icChangePassword,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.passwordChange,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(2);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icSaved,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.saved,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(3);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icReview,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.review,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(4);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icPrivacyPolicy,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.privacyPolicy,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(5);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icTerms,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.termsAndCondition,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(6);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icContact,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.contactUs,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(7);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icFqs,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.fAQs,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(8);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icLogout,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.deleteAccount,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
              ListTile(
                onTap: () {
                  controller.openNewPage(9);
                },
                leading: CommonWidgets.appIcons(
                    assetName: IconConstants.icLogout,
                    width: 40.px,
                    height: 40.px,
                    fit: BoxFit.fill),
                title: Text(
                  StringConstants.logout,
                  style: MyTextStyle.titleStyle13bb,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.px,
                  color: Colors.black54,
                ),
              ),
            ],
          );
        }));
  }
}
