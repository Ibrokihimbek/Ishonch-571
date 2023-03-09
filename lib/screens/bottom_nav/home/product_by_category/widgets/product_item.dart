import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/screens/bottom_nav/home/product_by_category/widgets/product_shimmer.dart';
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
          return Scaffold(
            body: state is GettingProductInProgress
                ? const Center(child: ShimmerWidget())
                : state is GettingProductInSuccess
                    ? ZoomTapAnimation(
                        onTap: onTap,
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4,
                                offset: const Offset(4, 2),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(18.r),
                            color: AppColors.white,
                          ),
                          margin: const EdgeInsets.all(12).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: Image.network(
                                    'http://146.190.207.16:3000/${state.product.media.media}'),
                              ),
                              SizedBox(height: 18.h),
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
                                    style: fontRobotoW300(
                                            appcolor: AppColors.black)
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
                      ),
          );
        },
      ),
    );
  }
}
