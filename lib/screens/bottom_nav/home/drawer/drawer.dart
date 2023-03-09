import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';

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
                      "Language",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.nights_stay_outlined),
                  title: Text(
                    "Night Mode",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  trailing: Switch(
                      activeColor: AppColors.black,
                      value: IsNightMode,
                      onChanged: onChanged),
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "/about"),
                  child: const ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About"),
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
