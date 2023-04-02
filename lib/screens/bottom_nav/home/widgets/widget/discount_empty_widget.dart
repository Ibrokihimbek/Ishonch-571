import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/discount_empty/discount_empty.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:ishonch/utils/text_style.dart';

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
              color: DiscountEmpty.discountEmpty[index].color,
            ),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Image.asset(
                  DiscountEmpty.discountEmpty[index].image,
                  width: DiscountEmpty.discountEmpty[index].image ==
                          'assets/images/home_appliance.png'
                      ? 130.w
                      : 100.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w).r,
                  // ignore: prefer_const_constructors
                  child: Divider(
                    thickness: 1,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  DiscountEmpty.discountEmpty[index].description.tr(),
                  textAlign: TextAlign.center,
                  style: fontRobotoW400(appcolor: AppColors.white),
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
