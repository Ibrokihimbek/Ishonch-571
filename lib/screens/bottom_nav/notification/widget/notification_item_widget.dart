import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/date_format.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../../../cubit/product_detail/product_detail_cubit.dart';
import '../../../../cubit/product_detail/product_detail_state.dart';
import '../../../../data/models/model_category/categories/product/product_model.dart';
import '../../../app_router.dart';
import 'notification_shimmer.dart';

class NotificationProductItem extends StatelessWidget {
  final String id;

  const NotificationProductItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubitById(id),
      child: BlocBuilder<ProductCubitById, ProductStateById>(
        builder: (context, state) {
          if (state is GettingProductInProgress) {
            return const NotificationShimmer();
          } else if (state is GettingProductInSuccess) {
            ProductModel productModel = state.product;
            String image = Uri.parse(
                        "http://146.190.207.16:3000/${state.product.media.media}")
                    .isAbsolute
                ? "http://146.190.207.16:3000/${state.product.media.media}"
                : "https://cdn3d.iconscout.com/3d/premium/thumb/product-5806313-4863042.png";
            return Column(
              children: [
                ZoomTapAnimation(
                  onTap: (() {
                    Navigator.pushNamed(
                      context,
                      RouteName.productDetail,
                      arguments: int.parse(id),
                    );
                  }),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h).h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.r).r,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(2, 3), // horizontal, vertical
                            blurRadius: 1.r,
                          ),
                        ]),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: image,
                            width: 80.w,
                            height: 80.h,
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
                        SizedBox(width: 32.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h),
                            Text(
                              productModel.brandName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).cardColor,
                                  ),
                            ),
                            Container(
                              height: 40.h,
                              width: 180.w,
                              padding: EdgeInsets.only(top: 5.h).w,
                              child: Text(
                                productModel.description,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 16.sp),
                              ),
                            ),
                            Text(
                              TimeUtils.formatDate(
                                DateTime.parse(productModel.createdAt),
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                  ),
                            ),
                            SizedBox(height: 5.h),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
