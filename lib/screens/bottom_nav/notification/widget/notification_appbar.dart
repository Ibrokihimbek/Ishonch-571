import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationAppBar extends StatelessWidget implements PreferredSize {
  const NotificationAppBar({Key? key, required this.onMute}) : super(key: key);

  final VoidCallback onMute;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Notification".tr(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Row(
                  children: [
                    Text("Mute Notification".tr()),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: onMute,
                child: Row(
                  children: [
                    Text("Clear All".tr()),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, 56.h);
}
