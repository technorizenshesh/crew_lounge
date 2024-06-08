import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/verify_identy_complete_controller.dart';

class VerifyIdentyCompleteView extends GetView<VerifyIdentyCompleteController> {
  const VerifyIdentyCompleteView({Key? key}) : super(key: key);
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
          CommonWidgets.appIcons(
              assetName: 'assets/images/img_verify_identy.png',
              width: double.infinity,
              height: 220.px,
              fit: BoxFit.fill),
        ],
      ),
    );
  }
}
