import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/bottom_nav/order/widget/shimmer_item.dart';


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

          SizedBox(height: 16.h,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                const ShimmerItem(),
                SizedBox(height: 12.h,),
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
