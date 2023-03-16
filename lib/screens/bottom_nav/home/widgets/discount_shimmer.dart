import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidgetByDiscount extends StatelessWidget {
  const ShimmerWidgetByDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: height(context) * 0.16,
        child: shimmerMethod(width: 280.w, height: height(context) * 0.19),
      ),
    );
  }

  Shimmer shimmerMethod({required num width, required num height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        margin: EdgeInsets.only(left: 12.h).r,
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
