import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/bloc/bloc_category/category_bloc.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'category_shimmer.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.index}) : super(key: key);

  int index;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    index % 2 == 0 ? isTrue = false : isTrue = true;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state is LoadCategoriesInSuccess) {
          var data = state.categories;
          return isTrue
              ? Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'http://146.190.207.16:3000/${data[index].categoryImage}',
                        width: 120.w,
                        height: 100.h,
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
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height(context) * 0.038,
                        ),
                        Text(
                          data[index].categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(
                          height: height(context) * 0.003,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${data[index].product.length} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: 'Produkt'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: height(context) * 0.038,
                        ),
                        Text(
                          data[index].categoryName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(
                          height: height(context) * 0.003,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${data[index].product.length} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: 'Produkt'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'http://146.190.207.16:3000/${data[index].categoryImage}',
                        width: 120.w,
                        height: 100.h,
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
                  ],
                );
        }
        if (state is LoadCategoriesInProgress) {
          return const Center(
            child: CategoryShimmerWidget(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
