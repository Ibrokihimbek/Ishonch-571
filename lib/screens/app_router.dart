import 'package:flutter/material.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/bottom_nav/bottom_nav_page.dart';
import 'package:ishonch/screens/bottom_nav/home/drawer/sub_screens/about_screen.dart';
import 'package:ishonch/screens/bottom_nav/home/drawer/sub_screens/language_screen.dart';
import 'package:ishonch/screens/bottom_nav/home/product_by_category/product_by_category.dart';
import 'package:ishonch/screens/no_internet/no_internet_screen.dart';
import 'package:ishonch/screens/on_bording/on_bording_page.dart';
import 'package:ishonch/screens/product_detail/product_detail_screen.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/check_out_screen.dart';
import 'package:ishonch/screens/product_detail/sub_screens/map/map_screen.dart';
import 'package:ishonch/screens/splash/splash_page.dart';

abstract class RouteName {
  static const bottomNavigation = 'bottomNavigation';
  static const splash = 'splash';
  static const productByCategory = 'productByCategory';
  static const onBoarding = 'onBoarding';
  static const productDetail = '/productDetail';
  static const languageChange = '/languageChange';
  static const about = '/about';
  static const checkOut = '/checkOut';
  static const map = '/map';
  static const noInternet = '/noInternet';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case RouteName.productByCategory:
        return MaterialPageRoute(
          builder: (_) => ProductByCategory(
            data: settings.arguments as CategoryModel,
          ),
        );
      case RouteName.productDetail:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            product: settings.arguments as int,
          ),
        );
      case RouteName.languageChange:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case RouteName.noInternet:
        return MaterialPageRoute(
          builder: (_) => NoInternetScreen(
            voidCallback: settings.arguments as VoidCallback,
          ),
        );
      case RouteName.about:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case RouteName.checkOut:
        return MaterialPageRoute(
          builder: (_) => CheckOutScreen(
            latLong: settings.arguments as LatLongModel,
          ),
        );
      case RouteName.map:
        return MaterialPageRoute(
          builder: (_) => MapScreen(
            latLongModel: settings.arguments as LatLongModel,
          ),
        );
      case RouteName.bottomNavigation:
        return MaterialPageRoute(builder: (_) => const BottomNavPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
