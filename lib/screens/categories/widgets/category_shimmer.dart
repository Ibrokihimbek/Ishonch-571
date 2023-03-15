import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerWidget extends StatelessWidget {
  const CategoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12).r,
          child: shimmerMethod(
            myHeight: height(context) * 0.15,
            myWidth: width(context),
            context: context,
          ),
        ));
  }

  Shimmer shimmerMethod({required num myWidth, required num myHeight,required BuildContext context}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: Container(
        width: myWidth.w,
        height: myHeight.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width(context) * 0.04),
          color: Colors.black,
        ),
      ),
    );
  }
}
