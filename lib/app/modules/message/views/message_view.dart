import 'package:crew_lounge/common/colors.dart';
import 'package:crew_lounge/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/apis/api_models/get_chat_message_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: WillPopScope(
          onWillPop: () => controller.clickOnBackButton(),
          child: SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                      height: 70.px,
                      padding: EdgeInsets.only(top: 5.px, bottom: 5.px),
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 35.px,
                              width: 35.px,
                              margin:
                                  EdgeInsets.only(left: 10.px, right: 10.px),
                              padding: EdgeInsets.only(left: 7.px),
                              decoration: CommonWidgets.kGradientBoxDecoration(
                                  showGradientBorder: true,
                                  borderRadius: 10.px),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: primary3Color,
                                size: 30.px,
                              ),
                            ),
                          ),
                          CommonWidgets.imageView(
                              image: controller.otherUserImage,
                              height: 60.px,
                              width: 60.px,
                              defaultNetworkImage:
                                  StringConstants.defaultNetworkImage,
                              borderRadius: BorderRadius.circular(30.px)),
                          SizedBox(
                            width: 5.px,
                          ),
                          Text(
                            controller.otherUserName,
                            style: MyTextStyle.titleStyle16bb,
                          ),
                        ],
                      )),
                  buildListMessage(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.px, vertical: 20.px),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonWidgets.commonTextFieldForLoginSignUP(
                            controller: controller.textController,
                            // onFieldSubmitted: (value) => controller.clickOnSendButton(),
                            borderRadius: 30.px,
                            // onTap: () => controller.jump(),
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2),
                            hintText: StringConstants.typeHere,
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Obx(() {
                                    controller.count.value;
                                    return controller.buttonValue.value
                                        ? Image.asset(
                                            IconConstants.icSend,
                                            height: 34.px,
                                            width: 34.px,
                                          )
                                        : InkWell(
                                            borderRadius:
                                                BorderRadius.circular(18.px),
                                            onTap: () =>
                                                controller.clickOnSendButton(),
                                            child: Image.asset(
                                              IconConstants.icSend,
                                              height: 34.px,
                                              width: 34.px,
                                            ),
                                          );
                                  }),
                                ],
                              ),
                            ),
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(8.px),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(18.px),
                                  onTap: () =>
                                      controller.clickOnAttachmentButton(),
                                  child: Icon(
                                    Icons.photo,
                                    size: 35.px,
                                  ),
                                )),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildListMessage() {
    return Expanded(
      child: (controller.result.isNotEmpty)
          ? ListView.builder(
              // reverse: true,
              controller: controller.scrollController,
              itemCount: controller.result.length,
              itemBuilder: (context, index) {
                GetChatResult item = controller.result[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    if (controller.result[index].date != null &&
                        (!controller.checkDateShowOrNot(
                                index == 0
                                    ? controller.result[0].date
                                    : controller.result[index - 1].date,
                                controller.result[index].date) ||
                            index == 0))
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.px),
                            decoration: CommonWidgets.kGradientBoxDecoration(
                                showGradientBorder: true, borderRadius: 5.px),
                            child: Center(
                              child: Text(
                                  DateFormat('dd-MM-yyyy')
                                      .format(DateTime.parse(item.date ?? ''))
                                      .toString(),
                                  style: MyTextStyle.titleStyle12bw),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 20.px),
                    Align(
                      alignment: item.senderId.toString() == controller.userId
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4.px,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.px),
                          child: Column(
                            crossAxisAlignment:
                                (item.senderId.toString() != controller.userId)
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              if (item.chatImage != '')
                                GestureDetector(
                                    onTap: () {
                                      controller.clickOnChatImagesAndDownload(
                                          item.chatImage!);
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonWidgets.imageView(
                                          height: 100.px,
                                          width: 100.px,
                                          image: item.chatImage!,
                                        ),
                                        SizedBox(height: 5.px),
                                        Text(
                                          controller
                                              .timeFormatAmPm(item.date ?? ''),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 8.px,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                        ),
                                      ],
                                    )),
                              if (item.chatMessage != null &&
                                  item.chatMessage.toString().isNotEmpty)
                                Column(
                                  children: [
                                    SizedBox(height: 4.px),
                                    Container(
                                      padding: EdgeInsets.all(8.px),
                                      decoration: BoxDecoration(
                                          color: (item.senderId.toString() !=
                                                  controller.userId)
                                              ? Colors.pinkAccent
                                                  .withOpacity(0.3)
                                              : const Color(0xffF3F3F3),
                                          borderRadius: (item.senderId
                                                      .toString() !=
                                                  controller.userId)
                                              ? BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.px),
                                                  topRight:
                                                      Radius.circular(10.px),
                                                  bottomRight:
                                                      Radius.circular(10.px))
                                              : BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.px),
                                                  topRight:
                                                      Radius.circular(10.px),
                                                  bottomLeft:
                                                      Radius.circular(10.px))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.chatMessage.toString() ?? '',
                                            textAlign: TextAlign.start,
                                            style: MyTextStyle.titleStyle14bb,
                                          ),
                                          SizedBox(height: 8.px),
                                          Text(
                                            controller.timeFormatAmPm(
                                                item.date ?? ''),
                                            textAlign: TextAlign.end,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 8.px,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          : const Center(
              child: Text('No messages...'),
            ),
    );
  }
}
