import 'package:flutter/material.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/bottom_nav/bottom_nav_page.dart';
import 'package:ishonch/screens/discount_product/discount_product_screen.dart';
import 'package:ishonch/screens/drawer/sub_screens/about_screen.dart';
import 'package:ishonch/screens/drawer/sub_screens/language_screen.dart';
import 'package:ishonch/screens/no_internet/no_internet_screen.dart';
import 'package:ishonch/screens/on_bording/on_bording_page.dart';
import 'package:ishonch/screens/product_by_category/product_by_category.dart';
import 'package:ishonch/screens/product_detail/product_detail_screen.dart';
import 'package:ishonch/screens/check_out/check_out_screen.dart';
import 'package:ishonch/screens/check_out/map/map_screen.dart';
import 'package:ishonch/screens/image_view/image_view_page.dart';
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
  static const imageView = '/imageView';
  static const discountProductDetail = '/discountProductDetail';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) =>  SplashPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) =>  OnBoardingPage());
      case RouteName.productByCategory:
        return MaterialPageRoute(
          builder: (_) => ProductByCategory(
            data: settings.arguments as CategoryModel,
          ),
        );
      case RouteName.productDetail:
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(
            productId: settings.arguments as int,
          ),
        );
      case RouteName.imageView:
        return MaterialPageRoute(
          builder: (_) => ImageView(
            imageUrl: settings.arguments as String,
          ),
        );
      case RouteName.languageChange:
        return MaterialPageRoute(builder: (_) =>  LanguageScreen());
      case RouteName.noInternet:
        return MaterialPageRoute(
          builder: (_) => NoInternetScreen(
            voidCallback: settings.arguments as VoidCallback,
          ),
        );
      case RouteName.about:
        return MaterialPageRoute(builder: (_) =>  AboutScreen());
      case RouteName.map:
        return MaterialPageRoute(
          builder: (_) => MapScreen(
            latLongModel: settings.arguments as LatLongModel,
          ),
        );
      case RouteName.discountProductDetail:
        return MaterialPageRoute(
            builder: (_) => DiscountProductDetailScreen(
                discountProduct: settings.arguments as Discount));
      case RouteName.bottomNavigation:
        return MaterialPageRoute(builder: (_) =>  BottomNavPage());
      default:
        return MaterialPageRoute(builder: (_) =>  Scaffold());
    }
  }
}
