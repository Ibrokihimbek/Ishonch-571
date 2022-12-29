import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:provider/provider.dart';
import 'package:ishonch/view_model/bottom_nav_view_model.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(Container(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 32),
      ),
    ));
    screens.add(Container(
      child: Text(
        'Favourite',
        style: TextStyle(fontSize: 32),
      ),
    ));
    screens.add(Container(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 32),
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var index = context.watch<BottomNavViewModel>().activePageIndex;
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: fontHelveticaW400(appcolor: AppColors.white)
            .copyWith(fontSize: 13.sp),
        unselectedLabelStyle: fontHelveticaW400(appcolor: AppColors.white)
            .copyWith(fontSize: 13.sp),
        backgroundColor: AppColors.C_1F1914,
        onTap: (value) =>
            Provider.of<BottomNavViewModel>(context, listen: false)
                .changePageIndex(value),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImage.iconHome,
              color: index == 0
                  ? AppColors.white
                  : AppColors.white.withOpacity(0.5),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.iconFavourite,
                color: index == 1
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.5),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppImage.iconProfile,
              color: index == 2
                  ? AppColors.white
                  : AppColors.white.withOpacity(0.5),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
