import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/cubit/bottom_nav/bottom_nav_cubit.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/bottom_nav/bottom_nav_bar.dart';
import 'package:ishonch/screens/drawer/drawer.dart';
import 'package:ishonch/screens/bottom_nav/home/home_page.dart';
import 'package:ishonch/screens/bottom_nav/notification/notification_page.dart';
import 'package:ishonch/utils/app_image.dart';
import '../../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';
import '../../cubit/connectivity/connectivity_cubit.dart';
import '../../service/get_it/get_it.dart';
import '../../service/notification_service/notification_service.dart';
import 'order/order_page.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  AdaptiveThemeMode? themeMode;

  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  Future<void> _switchTheme() async {
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<Widget> screens = [];

  @override
  void initState() {
    getIt<NotificationService>().handleFirebaseNotificationMessages();
    getIt<NotificationService>().setupInteractedMessage();
    _getMode();
    screens.insert(0, HomePage(onTap: () => _key.currentState!.openDrawer()));
    screens.insert(1, NotificationPage());
    screens.insert(2, OrdersPage());

    super.initState();
  }

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
    FirebaseMessaging.instance.subscribeToTopic("ishonch_news");
    // getIt<ProductsBloc>().add(FetchAllProducts());
    BlocProvider.of<ProductsBloc>(context).add(FetchAllProducts());
    BlocProvider.of<CategoriesBloc>(context).add(FetchAllCategories());
    getIt<NotificationReaderBloc>().add(ReadNotificationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityState>(
      listener: (context, state) {
        if (state.connectivityResult == ConnectivityResult.none) {
          Navigator.pushNamed(
            context,
            RouteName.noInternet,
            arguments: _init,
          );
        }
      },
      child: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            var index = context.watch<BottomNavCubit>().activePageIndex;
            return Scaffold(
              key: _key,
              drawer: MyDrawer(
                isNightMode: themeMode?.isDark ?? false,
                onChanged: (value) {
                  setState(() {});
                  _switchTheme();
                },
              ),
              body: IndexedStack(index: index, children: screens),
              bottomNavigationBar: BottomNavBar(
                iconSize: 30,
                selectedIndex: state,
                showElevation: true,
                onItemSelected: (index) {
                  context.read<BottomNavCubit>().changePageIndex(index);
                },
                items: [
                  BottomNavBarItem(
                    icon: (state == 0)
                        ? SvgPicture.asset(AppImages.home)
                        : SvgPicture.asset(AppImages.inactiveHome),
                    title: Text(
                      'Uy'.tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Colors.black,
                  ),
                  BottomNavBarItem(
                    icon: (state == 1)
                        ? SvgPicture.asset(AppImages.notification)
                        : SvgPicture.asset(AppImages.inactiveNotification),
                    title: Text(
                      "Yangiliklar".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Colors.black,
                  ),
                  BottomNavBarItem(
                    icon: (state == 2)
                        ? SvgPicture.asset(AppImages.cart)
                        : SvgPicture.asset(AppImages.inactiveCart),
                    title: Text(
                      "Buyurtma".tr(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    activeColor: Colors.black,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
