import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey,
      child: Container(
        padding: EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8).r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white, //                   <--- border color
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20.h,
                  width: 95.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4.r)),
                ),
                SizedBox()
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 16.h,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4.r)),
                ),
                Container(
                  height: 19.h,
                  width: 70.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4.r)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 17.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4.r)),
                ),
                Container(
                  height: 17.h,
                  width: 90.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(4.r)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
