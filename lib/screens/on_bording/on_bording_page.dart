import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/onbording_model/onbording_model.dart';
import 'package:ishonch/data/storage_repository/storage_repository.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/on_bording/widgets/on_boarding_item.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardinPage extends StatefulWidget {
  const OnboardinPage({super.key});

  @override
  State<OnboardinPage> createState() => _OnboardinPageState();
}

int currentIndex = 0;
PageController pageController = PageController();
String nextButton = 'Keyingi'.tr();

class _OnboardinPageState extends State<OnboardinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                      style: fontRobotoW400(appcolor: AppColors.black)
                          .copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: double.infinity,
              height: 600.h,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    if (currentIndex == 2) {
                      nextButton = 'Boshlash'.tr();
                    } else {
                      nextButton = 'Keyingi'.tr();
                    }
                  });
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemCount: OnboardingModel.onboard.length,
                itemBuilder: (BuildContext context, int index) {
                  return OnBoardingItem(
                      onboard: OnboardingModel.onboard[index]);
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20).r,
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (currentIndex == 1) {
                        nextButton = 'Boshlash'.tr();
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
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: nextButton == 'Keyingi'.tr() ? 150.w : 200.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.C_222222),
                      child: Center(
                        child: Text(
                          nextButton,
                          style: fontRobotoW500(appcolor: AppColors.white)
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

  void saveLogin(context) async {
    StorageRepository.putBool("first_time", true);
    Navigator.pushReplacementNamed(context, RouteName.bottomNavigation);
  }
}
