import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  const GlobalAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.tr(),
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(fontSize: 22.sp),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: ZoomTapAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            Theme.of(context).appBarTheme.backgroundColor == Colors.white
                ? AppImages.iconBackArrow
                : AppImages.iconBackArrowLight,
          ),
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
