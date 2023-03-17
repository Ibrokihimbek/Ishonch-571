import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:shimmer/shimmer.dart';
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
      padding: EdgeInsets.only(top: screenHeight * 0.01),
      height: screenHeight * 0.15,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: ((buildContext, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RouteName.productByCategory,
                  arguments: data[index]);
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        "http://146.190.207.16:3000/${data[index].categoryImage}",
                    height: screenHeight * 0.09,
                    width: screenWidth * 0.2,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return Shimmer.fromColors(
                        period: const Duration(seconds: 2),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          width: 120,
                          height: 100,
                          color: Colors.white,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  data[index].categoryName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 14.sp),
                )
              ],
            ),
          );
        }),
        separatorBuilder: (context, index) {
          return SizedBox(width: screenWidth * 0.03);
        },
      ),
    );
  }

  @override
  double get maxExtent => screenHeight * 0.15;

  @override
  double get minExtent => screenHeight * 0.15;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
