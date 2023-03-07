import 'package:flutter/material.dart';
import 'package:ishonch/screens/bottom_nav/bottom_nav_page.dart';
import 'package:ishonch/screens/onbording/onbording_page.dart';
import 'package:ishonch/screens/product_detail/product_detail_screen.dart';
import 'package:ishonch/screens/splash/splash_page.dart';

abstract class RouteName {
  static const bottomNavigation = 'bottomNavigation';
  static const splash = 'splash';
  static const onBoarding = 'onBoarding';
  static const productDetail = '/productDetail';
  // static const register = 'register';
  // static const forgot = 'forgot';
  // static const home = 'home';
  // static const productInfo = 'productInfo';
  // static const search = 'search';
  // static const checkout = 'checkout';
  // static const successPayment = 'successPayment';
  // static const profile = 'profile';
}
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardinPage());
      case RouteName.productDetail:
        return MaterialPageRoute(builder: (_) => ProductDetailScreen());
      // case RoutName.register:
      //   return MaterialPageRoute(builder: (_) => RegisterPage());
      // case RoutName.forgot:
      //   return MaterialPageRoute(builder: (_) => ForgotPage());
      case RouteName.bottomNavigation:
        return MaterialPageRoute(builder: (_) => BottomNavPage());
      // case RoutName.checkout:
      //   return MaterialPageRoute(builder: (_) => CheckoutPaage());
      // case RoutName.home:
      //   return MaterialPageRoute(builder: (_) => HomePage());
      // case RoutName.profile:
      //   return MaterialPageRoute(builder: (_) => ProfilePage());
      // case RoutName.successPayment:
      //   return MaterialPageRoute(builder: (_) => SuccesPaymentPage());
      // case RoutName.productInfo:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductInfoPage(
      //       productInfo: args['productInfo'],
      //     ),
      //   );
      // case RoutName.search:
      //   return MaterialPageRoute(builder: (_) => SearchPage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}