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
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
          create: (context) =>
              OrdersBloc(CategoriesRepo(apiService: ApiService())),
        )
      ], child: const MyApp()),
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
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          initialRoute: RouteName.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Ishonch 571',
          theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.blue,
          ),
        );
      },
    );
  }
}
