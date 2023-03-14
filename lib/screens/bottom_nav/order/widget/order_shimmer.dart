import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/bottom_nav/order/widget/shimmer_item.dart';
import 'package:shimmer/shimmer.dart';


class OrderShimmer extends StatelessWidget {
  const OrderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h,top: 10.h,left: 24.h,right: 24.h),
      alignment: Alignment.center,
      height: 520.h,
      width: 400.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 24),
          Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: Colors.grey,
            child: Container(
              height: 105,
              width: 105,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white, //                   <--- border color
                    width: 0.9,
                  ),
                  borderRadius: BorderRadius.circular(60)),
              child: const Icon(Icons.person_outline_sharp,size: 60,),
            ),
          ),
          SizedBox(height: 16.h,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h),
                    height: 30.h,
                    width: 135.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h),
                    height: 13.h,
                    width: 200.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                ),
                SizedBox(height: 4.h,),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey,
                  child: Container(
                    margin: EdgeInsets.only(top: 4.h),
                    height: 13.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4.r)
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                const ShimmerItem(),
                SizedBox(height: 12.h,),
                const ShimmerItem(),

              ],
            ),
          )

        ],
      ),
    );
  }
}
