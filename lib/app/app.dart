import 'package:easy_localization/easy_localization.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/bloc/bloc_product/product_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/cubit/connectivity/connectivity_cubit.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/cubit/order_create/order_create_cubit.dart';
import 'package:ishonch/cubit/discount/discount_cubit.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/data/repositories/geocoding_repository.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/service/api_service/api_service.dart';

import '../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';

import '../cubit/bottom_nav/bottom_nav_cubit.dart';
import '../cubit/location_permission/location_permission_cubit.dart';

import '../service/get_it/get_it.dart';
import '../utils/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
        Locale('uz', 'UZ')
      ],
      startLocale: const Locale('en', 'EN'),
      path: 'assets/translation',
      fallbackLocale: const Locale("uz", "UZ"),
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BottomNavCubit(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsBloc(CategoriesRepo())..add(FetchAllProducts()),
        ),
        BlocProvider(
          create: (context) => OrderCreateCubit(),
        ),
        BlocProvider(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
            create: (context) =>
                getIt<NotificationReaderBloc>()..add(ReadNotificationEvent())),
        BlocProvider(
          create: (context) => OrdersBloc(CategoriesRepo()),
        ),
        BlocProvider(
          create: (context) => OrdersBloc(CategoriesRepo()),
        ),
        BlocProvider(
          create: (context) => OrdersBloc(CategoriesRepo()),
        ),
        BlocProvider(
          create: (context) => MapCubit(
            geocodingRepo: GeocodingRepo(
              apiService: ApiService(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => DiscountCubit(),
        ),
        BlocProvider(
          create: (context) => LocationPermissionCubit(),
        )
      ], child: MyApp()),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            builder: (BuildContext context, Widget? child) => AdaptiveTheme(
              light: AppTheme.lightTheme,
              dark: AppTheme.darkTheme,
              initial: AdaptiveThemeMode.system,
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
        });
  }
}
