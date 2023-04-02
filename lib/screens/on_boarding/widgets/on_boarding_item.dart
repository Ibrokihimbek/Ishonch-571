import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/on_boarding_model/on_boarding_model.dart';
import 'package:lottie/lottie.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel onboard;
  const OnBoardingItem({super.key, required this.onboard});

  @override
  Widget build(BuildContext context) {
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
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 32.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
