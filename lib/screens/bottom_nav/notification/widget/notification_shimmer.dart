import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      height: 94.h,
      width: 400.w,
      child: Column(children: [
        Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              child: Container(
                height: 60.h,
                width: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.h),
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 32.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 16.h,
                    width: 130.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.h),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 16.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.h),
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  margin: EdgeInsets.only(top: 4.h),
                  width: 80,
                  height: 18.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8.r)),
                  // child: Text("Published at ${course.createdAt.hour}:${course.createdAt.minute}",style: TextStyle(fontSize: 12.sp,color: Theme.of(context).textTheme.titleSmall!.color),),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(
          thickness: 0.2,
        )
      ]),
    );
  }
}
