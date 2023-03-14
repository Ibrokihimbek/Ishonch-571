import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/screens/product_by_category/widgets/product_shimmer.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductByCategoryItem extends StatelessWidget {
  final int productId;
  final VoidCallback onTap;

  const ProductByCategoryItem(
      {super.key, required this.onTap, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubitById(productId.toString()),
      child: BlocBuilder<ProductCubitById, ProductStateById>(
        builder: (context, state) {
          return state is GettingProductInProgress
              ? const Center(child: ShimmerWidget())
              : state is GettingProductInSuccess
                  ? ZoomTapAnimation(
                      onTap: onTap,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              blurRadius: 4,
                              spreadRadius: 3,
                              offset: const Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14.r),
                          color: Theme.of(context).primaryColor,
                        ),
                        margin: const EdgeInsets.all(10).r,
                        padding: const EdgeInsets.symmetric(vertical: 10).r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'http://146.190.207.16:3000/${state.product.media.media}',width: 120.w,
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
                            SizedBox(height: 10.h),
                            Center(
                              child: ListTile(
                                title: Text(
                                  state.product.productName,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontSize: 16.sp,fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  'Price: ${state.product.productPrice}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 14.sp,fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Lottie.asset(
                        AppImages.lottieItem,
                        width: 200.w,
                      ),
                    );
        },
      ),
    );
  }
}
