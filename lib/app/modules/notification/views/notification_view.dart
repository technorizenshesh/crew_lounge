import 'package:crew_lounge/app/data/constants/string_constants.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_notification.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(
            wantBackButton: true,
            showColorBackButton: true,
            title: StringConstants.notifications),
        body: Obx(() {
          controller.count.value;
          return CommonWidgets.customProgressBar(
              inAsyncCall: controller.inAsyncCall.value,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.px,
                    ),
                    showNotifications(),
                    if (controller.notificationsList.isEmpty)
                      CommonWidgets.dataNotFound(),
                    SizedBox(
                      height: 20.px,
                    ),
                  ],
                ),
              ));
        }));
  }

  Widget showNotifications() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.notificationsList.length,
        itemBuilder: (context, index) {
          NotificationResult item = controller.notificationsList[index];
          return Dismissible(
            key: Key(item.id ?? ''),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.cyan,
                    Colors.purpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.px),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text(
                    StringConstants.delete,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              ),
            ),
            onDismissed: (direction) {
              controller.notificationsList.removeAt(index);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px),
              ),
              elevation: 2.px,
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 5.px, vertical: 3.px),
                leading: CommonWidgets.imageView(
                    image: item.userImage ?? '',
                    height: 50.px,
                    width: 50.px,
                    borderRadius: BorderRadius.circular(25.px),
                    defaultNetworkImage: StringConstants.defaultNetworkImage,
                    fit: BoxFit.fill),
                title: Text(
                  item.userName ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 16.px, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  item.message ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 12.px, fontWeight: FontWeight.w400),
                ),
                trailing: SizedBox(
                  width: 70.px,
                  child: Text(
                    item.dateTime.toString().substring(0, 10),
                    style: MyTextStyle.titleStyle10b,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
