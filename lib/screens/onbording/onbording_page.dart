import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/onbording_model/onbording_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardinPage extends StatefulWidget {
  const OnboardinPage({super.key});

  @override
  State<OnboardinPage> createState() => _OnboardinPageState();
}

int currentIndex = 0;
PageController pageController = PageController();
String NextButton = 'Keyingi'.tr();

class _OnboardinPageState extends State<OnboardinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: InkWell(
                    onTap: () {
                      saveLogin(context);
                    },
                    child: Text(
                      'Oʻtkazib yuborish'.tr(),
                      style: fontHelveticaW400(appcolor: AppColors.black)
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              height: 500.h,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 2) {
                      NextButton = 'Boshlash'.tr();
                    } else {
                      NextButton = 'Keyingi'.tr();
                    }
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: OnboardingModel.onboard.length,
                itemBuilder: (BuildContext context, int index) {
                  return OnboardItem(OnboardingModel.onboard[index]);
                },
              ),
            ),
            SizedBox(height: 69.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 1) {
                        NextButton = 'Boshlash'.tr();
                      }
                      if (currentIndex == 2) {
                        saveLogin(context);
                      }
                      setState(() {
                        pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.ease);
                      });
                    },
                    child: Container(
                      width: NextButton == 'Keyingi'.tr() ? 150.w : 200.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.C_222222),
                      child: Center(
                        child: Text(
                          NextButton,
                          style: fontHelveticaW500(appcolor: AppColors.white)
                              .copyWith(fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget OnboardItem(OnboardingModel onboard) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Lottie.asset(onboard.lottieName, width: 287.w),
        SizedBox(height: 40.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40).r,
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                onboard.title.tr(),
                style: fontHelveticaW700(appcolor: AppColors.black)
                    .copyWith(fontSize: 32.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isLoggedIn", true);

    Navigator.pushReplacementNamed(context, RouteName.bottomNavigation);
  }
}
