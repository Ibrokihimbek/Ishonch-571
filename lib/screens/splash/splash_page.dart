import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/storage_repository/storage_repository.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goNext();
  }

  void goNext() {
    Future.delayed(const Duration(seconds: 3), () async {
      bool firstTime = StorageRepository.getBool("first_time", defValue: false);
      if (firstTime == false) {
        Navigator.pushReplacementNamed(context, RouteName.onBoarding);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.bottomNavigation);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 132.5.w,
              height: 68.64.h,
              child: Image.asset(AppImages.imageLogo),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              child: Text(
                'Ishonch 571',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
