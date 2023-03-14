import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigationService._();
  static NavigationService instance = NavigationService._();

  Future<dynamic> navigateToErrorScreen(
      {required String routeName, var arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
}