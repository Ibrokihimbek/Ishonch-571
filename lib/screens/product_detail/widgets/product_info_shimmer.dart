import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductInfoShimmer extends StatelessWidget {
  const ProductInfoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: shimmerMethod(double.infinity, 300)),
              SizedBox(height: 20.r),
              shimmerMethod(180, 30),
              SizedBox(height: 12.h),
              shimmerMethod(260, 25),
              SizedBox(height: 8.h),
              shimmerMethod(280, 25),
              SizedBox(height: 16.h),
              shimmerMethod(100, 20),
              SizedBox(height: 8.h),
              shimmerMethod(200, 25),
              SizedBox(height: 20.r),
              shimmerMethod(150, 20),
              SizedBox(height: 15.h),
              shimmerMethod(280, 20),
              SizedBox(height: 4.h),
              shimmerMethod(double.infinity, 20),
              SizedBox(height: 4.h),
              shimmerMethod(285, 20),
              SizedBox(height: 4.h),
              shimmerMethod(295, 20),
              SizedBox(height: 4.h),
              shimmerMethod(200, 20),
              SizedBox(height: 30.h),
              shimmerMethod(double.infinity, 60),
            ],
          ),
        ),
      ),
    );
  }

  Shimmer shimmerMethod(num width, num height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.black,
        ),
      ),
    );
  }
}
