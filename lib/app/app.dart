import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/cubit/connectivity/connectivity_cubit.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/bottom_nav/bloc/bottom_nav_cubit.dart';
import 'package:ishonch/service/api_service/api_service.dart';

import '../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';
import '../utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('en', 'EN'),
      ],
      path: 'assets/translation',
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),

        ),
        BlocProvider(
          create: (context) => OrdersBloc(CategoriesRepo(apiService: ApiService())),

        ),
        BlocProvider(
          create: (context) => NotificationReaderBloc(),

        )
      ], child: MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => MaterialApp(
          initialRoute: RouteName.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Ishonch 571',
          theme: light,
          darkTheme: dark,
        ),
      ),
    );
  }
}
