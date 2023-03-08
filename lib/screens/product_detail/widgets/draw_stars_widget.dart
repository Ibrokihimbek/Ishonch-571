import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/utils/app_image.dart';

class DrawStarWidget extends StatelessWidget {
  const DrawStarWidget({Key? key, required this.itemCount}) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.w,
      height: 20.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          return SizedBox(width: 5.w);
        },
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SvgPicture.asset(
            AppImages.iconStar,
            width: 20.w,
            height: 20.h,
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
