import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_image.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSize {
  const HomeScreenAppBar({Key? key, required this.title, required this.onTap})
      : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(
          Theme.of(context).appBarTheme.backgroundColor == Colors.white
              ? AppImages.iconMenu
              : AppImages.iconMenuLight,
        ),
      ),
      title: Text(
        title.tr(),
        style:
            Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 22.sp),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
