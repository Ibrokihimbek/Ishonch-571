import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/screens/bottom_nav/bloc/bottom_nav_cubit.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

import 'bottom_navy_bar.dart';

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
            bottomNavigationBar: BottomNavyBar(
              iconSize: 30,
              selectedIndex: state,
              showElevation: true,
              onItemSelected: (index) {
                context.read<BottomNavCubit>().changePageIndex(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: (state == 0)
                      ? SvgPicture.asset(AppImages.home)
                      : SvgPicture.asset(AppImages.inactiveHome),
                  title: Text(
                    'Home',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  activeColor: Colors.black,
                ),
                BottomNavyBarItem(
                  icon: (state == 1)
                      ? SvgPicture.asset(AppImages.notification)
                      : SvgPicture.asset(AppImages.inactiveNotification),
                  title: Text(
                    "News",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  activeColor: Colors.black,
                ),
                BottomNavyBarItem(
                  icon: (state == 2)
                      ? SvgPicture.asset(AppImages.cart)
                      : SvgPicture.asset(AppImages.inactiveCart),
                  title: Text(
                    "Orders",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  activeColor: Colors.black,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
