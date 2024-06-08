import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/verify_identity_controller.dart';

class VerifyIdentityView extends GetView<VerifyIdentityController> {
  const VerifyIdentityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(
          wantBackButton: true,
          showColorBackButton: true,
          title: StringConstants.verifyIdentity),
      body: Column(
        children: [
          SizedBox(
            height: 20.px,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.px),
            ),
            elevation: 5.px,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(20.px),
            child: Container(
              height: 220.px,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0xffFCE4EC), Color(0xffF48FB1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.verificationCodeConfirmation,
                    style: MyTextStyle.titleStyle18bb,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.px,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.px, right: 20.px),
                    child: Text(
                      StringConstants
                          .provideAPhotoOfYouHoldingTheVerificationTheVerification,
                      style: MyTextStyle.titleStyle12bw,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.clickOnPlushIcon();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonWidgets.appIcons(
                            assetName: IconConstants.icAdd,
                            width: 42.px,
                            height: 42.px,
                            fit: BoxFit.fill),
                        SizedBox(
                          width: 10.px,
                        ),
                        Text(
                          StringConstants.select,
                          style: MyTextStyle.titleStyleCustom(
                              16, FontWeight.bold, Colors.indigo),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
