import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey,
          child: Container(
            height: 84,
            width: 156,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white, //                   <--- border color
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(Icons.person),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(height: 20.h,),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 12.h,
                      width: 60.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 12.h,
                      width: 30.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                  ],)


              ],),
          ),
        ),
        SizedBox(width: 16.w),
        Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: Colors.grey,
          child: Container(
            height: 84,
            width: 156,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.white, //                   <--- border color
                  width: 0.7,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(Icons.person),
                const SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    SizedBox(height: 20.h,),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 12.h,
                      width: 60.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      height: 12.h,
                      width: 30.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4.r)
                      ),
                    ),
                  ],)


              ],),
          ),
        )
      ],
    );
  }
}
