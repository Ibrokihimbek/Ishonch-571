import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/app_router.dart';
import '../../../../../data/models/model_category/categories/category_model.dart';

class CategoriesList extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  final double screenWidth;
  final List<CategoryModel> data;

  CategoriesList({
    required this.screenHeight,
    required this.screenWidth,
    required this.data,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: EdgeInsets.only(
            left: screenWidth * 0.055, top: screenHeight * 0.01),
        height: screenHeight * 0.15,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteName.productByCategory,
                    arguments: data[index]);
              },
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            scale: 4,
                            colorFilter: ColorFilter.mode(
                                Color(0xFFDEE6E3).withOpacity(0.5),
                                BlendMode.darken),
                            image: NetworkImage(
                                "http://146.190.207.16:3000/${data[index].categoryImage}")),
                        border: Border.all(color: Colors.black26),
                        color: const Color(0xFFDEE6E3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    data[index].categoryName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).cardColor),
                  )
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(width: screenWidth * 0.03);
          },
        ));
  }

  @override
  double get maxExtent => screenHeight * 0.15;

  @override
  double get minExtent => screenHeight * 0.15;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
