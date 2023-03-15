import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/notification/notification_model.dart';

// ignore: must_be_immutable
class MessageItem extends StatelessWidget {
  NotificationModel notification;

  MessageItem({required this.notification, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            width: 400,
            child: ListTile(
              title: Text("title"),
            )),
        Container(
            margin: const EdgeInsets.only(right: 20),
            width: 400,
            child: Text(
              notification.id,
              textAlign: TextAlign.end,
            )),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: const Divider(
              thickness: 0.2,
            )),
      ],
    );
  }
}
