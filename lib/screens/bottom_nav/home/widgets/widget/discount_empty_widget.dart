import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/discount_empty/discount_empty.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';

class DiscountEmptyWidget extends StatelessWidget {
  const DiscountEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: width(context),
      child: CarouselSlider(
        items: List.generate(
          DiscountEmpty.discountEmpty.length,
          (index) => Container(
            height: height(context) * 0.19,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).cardColor),
              borderRadius: BorderRadius.circular(height(context) * 0.025),
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Image.asset(
                  Theme.of(context).scaffoldBackgroundColor == AppColors.white
                      ? AppImages.imageLogo
                      : AppImages.imageLogoLight,
                  width: 100.w,
                ),
                Text(
                  'Ishonch 571',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 18.sp),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w).r,
                  child: Divider(
                    thickness: 1,
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Text(
                  DiscountEmpty.discountEmpty[index].tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 16.sp),
                )
              ],
            ),
          ),
        ),
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 0,
        ),
      ),
    );
  }
}
