import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/screens/product_by_category/widgets/product_shimmer.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductByCategoryItem extends StatelessWidget {
  final int productId;
  final VoidCallback onTap;

  const ProductByCategoryItem(
      {super.key, required this.onTap, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubitById(productId),
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
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                              spreadRadius: 3,
                              offset: const Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(14.r),
                          color: AppColors.white,
                        ),
                        margin: const EdgeInsets.all(10).r,
                        padding: const EdgeInsets.symmetric(vertical: 10).r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://146.190.207.16:3000/${state.product.media.media}',
                                width: 115,
                                height: 115,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Center(
                              child: ListTile(
                                title: Text(
                                  state.product.productName,
                                  textAlign: TextAlign.center,
                                  style: fontRobotoW600(
                                    appcolor: AppColors.black,
                                  ).copyWith(fontSize: 16.sp),
                                ),
                                subtitle: Text(
                                  'Price: ${state.product.productPrice}',
                                  textAlign: TextAlign.center,
                                  style:
                                      fontRobotoW300(appcolor: AppColors.black)
                                          .copyWith(fontSize: 14.sp),
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
