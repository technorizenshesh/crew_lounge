import 'package:crew_lounge/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../controllers/my_test_controller.dart';

class MyTestView extends GetView<MyTestController> {
  const MyTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTestView'),
        centerTitle: true,
      ),
      body: Center(
        child: cardView(),
      ),
    );
  }

  Widget cardView() {
    return Center(
      child: SizedBox(
          height: 250,
          width: 200,
          child: SwipeCards(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.images[index],
                    fit: BoxFit.fill,
                  ));
            },
            onStackFinished: () {
              CommonWidgets.showMyToastMessage("Stack Finished");
            },
            matchEngine: controller.matchEngine,
          )),
    );
  }
}
