import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/cubit/location_permission/location_permission_cubit.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';

import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info_shimmer.dart';
import 'package:ishonch/screens/widgets/dialog_widget.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../check_out/check_out_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final int productId;

  const ProductDetailScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubitById(productId.toString()),
      child: BlocBuilder<ProductCubitById, ProductStateById>(
        builder: (context, state) {
          return Scaffold(
            body: state is GettingProductInProgress
                ? const Center(child: ProductInfoShimmer())
                : state is GettingProductInSuccess
                    ? SafeArea(
                        child: CustomScrollView(
                          physics: const BouncingScrollPhysics(),
                          slivers: [
                            SliverAppBar(
                              expandedHeight: 350.h,
                              stretch: true,
                              leading: Padding(
                                padding: const EdgeInsets.all(8),
                                child: ZoomTapAnimation(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    Theme.of(context)
                                                .appBarTheme
                                                .backgroundColor ==
                                            Colors.white
                                        ? AppImages.iconBackArrow
                                        : AppImages.iconBackArrowLight,
                                  ),
                                ),
                              ),
                              pinned: true,
                              flexibleSpace: FlexibleSpaceBar(
                                background: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RouteName.imageView,
                                        arguments:
                                            'http://146.190.207.16:3000/${state.product.media.media}');
                                  },
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "http://146.190.207.16:3000/${state.product.media.media}",
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
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: 1,
                                (BuildContext context, int index) {
                                  return BlocListener<LocationPermissionCubit,
                                      LocationPermissionState>(
                                    listener: (context, state) {
                                      if (state.myPermissionStatus ==
                                          MyPermissionStatus.loading) {
                                        showDialog(
                                          barrierDismissible: false,
                                          builder: (context) => LoadingDialog(
                                            widget: Lottie.asset(
                                                AppImages.locationLoading),
                                          ),
                                          context: context,
                                        );
                                      }
                                      if (state.myPermissionStatus ==
                                          MyPermissionStatus.success) {
                                        BlocProvider.of<MapCubit>(context)
                                            .fetchAddress(
                                          latLongModel: state.latLongModel!,
                                          kind: "house",
                                        );
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => CheckOutScreen(
                                              latLong: state.latLongModel!,
                                              productId: productId,
                                              isDiscount: false,
                                            ),
                                          ),
                                        );
                                      }
                                      if (state.myPermissionStatus ==
                                          MyPermissionStatus.fail) {
                                        showInfoSnackBar(
                                            context, "ruxsat_topilmadi".tr());
                                      }
                                    },
                                    child: ProductInfo(
                                      product: state.product,
                                      onTap: () {
                                        BlocProvider.of<
                                                    LocationPermissionCubit>(
                                                context)
                                            .fetchCurrentLocation();
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
