import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';

// ignore: must_be_immutable
class MyDrawer extends StatefulWidget {
  ValueChanged onChanged;
  bool isNightMode;

  MyDrawer({super.key, required this.onChanged, required this.isNightMode});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  AdaptiveThemeMode? themeMode;

  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  @override
  void initState() {
    _getMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(25).r,
            child: Column(
              children: [
                SizedBox(
                  width: 132.5.w,
                  height: 68.64.h,
                  child: Image.asset(
                    Theme.of(context).dialogBackgroundColor == Colors.white
                        ? AppImages.imageLogo
                        : AppImages.imageLogoLight,
                  ),
                ),
                SizedBox(
                  child: Text('Ishonch 571',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300.h,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/languageChange");
                  },
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      "Til".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.nights_stay_outlined),
                  title: Text(
                    "Tungi_Rejim".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                  trailing: Switch(
                      activeColor: AppColors.white,
                      inactiveThumbColor: AppColors.black,
                      value: widget.isNightMode,
                      onChanged: widget.onChanged),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/about"),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text(
                      "Haqimizda".tr(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
