import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesTitle extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  final double screenWidth;
  final String title;
  final Widget page;

  AllCategoriesTitle({
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
    required this.page,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => page));
            },
            child: Container(
              width: 60.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text(
                'Davomi'.tr(),
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              ),),
            )
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => screenHeight * 0.05;

  @override
  double get minExtent => screenHeight * 0.05;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
