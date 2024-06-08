import 'package:crew_lounge/app/data/constants/icons_constant.dart';
import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      controller.count.value;
      return Center(
          child: SizedBox(
              height: 100.px,
              width: 130.px,
              child: CommonWidgets.appIcons(
                  assetName: IconConstants.icLogo, fit: BoxFit.fill)));
    }));
  }
}
