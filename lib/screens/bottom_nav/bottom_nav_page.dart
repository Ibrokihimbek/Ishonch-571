import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/screens/bottom_nav/bloc/bottom_nav_cubit.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 32),
      ),
    ));
    screens.add(const Center(
      child: Text(
        'Favourite',
        style: TextStyle(fontSize: 32),
      ),
    ));
    screens.add(const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 32),
      ),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          var index = context.watch<BottomNavCubit>().activePageIndex;
          return Scaffold(
            body: screens[index],
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: fontRobotoW400(appcolor: AppColors.white)
                  .copyWith(fontSize: 13.sp),
              unselectedLabelStyle: fontRobotoW400(appcolor: AppColors.white)
                  .copyWith(fontSize: 13.sp),
              backgroundColor: AppColors.C_1F1914,
              onTap: (value) => BlocProvider.of<BottomNavCubit>(context)
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
        },
      ),
    );
  }
}
