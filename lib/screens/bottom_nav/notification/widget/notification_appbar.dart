import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_image.dart';

class NotificationAppBar extends StatelessWidget implements PreferredSize {
  const NotificationAppBar({Key? key, required this.onMute}) : super(key: key);

  final VoidCallback onMute;

  @override
  Widget build(BuildContext context) {
    return AppBar(

     leading: Padding(
         padding: const EdgeInsets.all(10),
         child: SvgPicture.asset(AppImages.iconBackArrow)),
      title: Text(
        "Notification",
        style: Theme.of(context).textTheme.headlineMedium,

      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {},
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Row(
                  children: const [
                    Text("Mute Notification"),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: onMute,
                child: Row(
                  children: const [
                    Text("Clear All"),
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
  Size get preferredSize => const Size(
        double.infinity,
        56,
      );
}
