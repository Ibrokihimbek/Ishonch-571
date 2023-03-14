import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
      BuildContext context, double shzzrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => page));
            },
            child: Text(
              'Davomi'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
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
