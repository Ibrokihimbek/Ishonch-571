import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/bottom_nav/bloc/bottom_nav_cubit.dart';
import 'package:ishonch/screens/bottom_nav/order/order_page.dart';
import 'package:ishonch/screens/bottom_nav/widgets/bottom_nav_bar.dart';
import 'package:ishonch/screens/bottom_nav/home/view/home_page.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

import '../../cubit/connectivity/connectivity_cubit.dart';
import '../../service/get_it/get_it.dart';
import '../../service/notification_service/notification_service.dart';
import 'bottom_navy_bar.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  List<Widget> screens = [
    HomePage(),
    Center(
      child: Text(
        '',
        style: TextStyle(fontSize: 32),
      ),
    ),
    OrdersPage(),
  ];

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
  }
 @override
  void initState() {
   getIt<NotificationService>().handleFirebaseNotificationMessages();
   getIt<NotificationService>().setupInteractedMessage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          BlocListener<ConnectivityCubit, ConnectivityState>(
            listener: (context, state) {
              if (state.connectivityResult == ConnectivityResult.none) {
                Navigator.pushNamed(
                  context,
                  RouteName.noInternet,
                  arguments: _init,
                );
              }
            },
            child: const SizedBox(),
          );
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
