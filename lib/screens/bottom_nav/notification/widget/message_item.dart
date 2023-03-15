import 'package:easy_localization/easy_localization.dart';
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
        SizedBox(
          width: 400.w,
          child: ListTile(
            title: Text("Title".tr()),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.w).w,
          width: 400.w,
          child: Text(notification.id, textAlign: TextAlign.end),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w).w,
          child: Divider(thickness: 0.2.w),
        ),
      ],
    );
  }
}
