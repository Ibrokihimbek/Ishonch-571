import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/screens/bottom_nav/bloc/bottom_nav_cubit.dart';
import 'package:ishonch/screens/bottom_nav/widgets/bottom_nav_bar.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [
    Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 32),
      ),
    ),
    Center(
      child: Text(
        'Favourite',
        style: TextStyle(fontSize: 32),
      ),
    ),
    Center(
  child: Text(
  'Profile',
  style: TextStyle(fontSize: 32),
  ),
  )

  ];



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        var index = context.watch<BottomNavCubit>().activePageIndex;
        return Scaffold(
          body: screens[index],
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
