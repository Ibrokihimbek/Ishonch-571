import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class MyDrawer extends StatelessWidget {
  bool IsNightMode;
  ValueChanged onChanged;
  MyDrawer({super.key, required this.IsNightMode, required this.onChanged});

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
                  child: Image.asset(AppImages.imageLogo),
                ),
                SizedBox(
                  child: Text(
                    'Ishonch 571',
                    style: fontRobotoW700(appcolor: AppColors.black)
                        .copyWith(fontSize: 24.sp),
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                      style: fontRobotoW500(appcolor: AppColors.black)
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.nights_stay_outlined),
                  title: Text(
                    "Tungi Rejim".tr(),
                    style: fontRobotoW500(appcolor: AppColors.black)
                        .copyWith(fontSize: 16.sp),
                  ),
                  trailing: Switch(
                      activeColor: AppColors.black,
                      value: IsNightMode,
                      onChanged: onChanged),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/about"),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text("About".tr()),
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
