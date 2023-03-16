import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmerLoader extends StatelessWidget {
  const HomeScreenShimmerLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w).r,
            child: Container(
              height: height(context) * 0.19.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(height(context) * 0.025),
                  color: AppColors.white),
            ),
          ),
          SizedBox(height: height(context) * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.055),
            child: Container(
              width: double.infinity,
              height: 17.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: height(context) * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Padding(
                padding: EdgeInsets.only(top: height(context) * 0.01),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w).r,
                      child: Container(
                        height: height(context) * 0.09,
                        width: width(context) * 0.2,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                    SizedBox(
                      height: height(context) * 0.005,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w).r,
                      child: Container(
                        width: width(context) * 0.2,
                        height: 17.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height(context) * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width(context) * 0.055),
            child: Container(
              width: double.infinity,
              height: 17.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: height(context) * 0.02),
          Expanded(
            child: GridView.builder(
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w).r,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
