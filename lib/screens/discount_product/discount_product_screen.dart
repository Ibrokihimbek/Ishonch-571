import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/cubit/location_permission/location_permission_cubit.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';

import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/discount_product/widgets/discount_product_info.dart';
import 'package:ishonch/screens/widgets/dialog_widget.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/my_utils.dart';
import '../check_out/check_out_screen.dart';

class DiscountProductDetailScreen extends StatelessWidget {
  final Discount discountProduct;

  const DiscountProductDetailScreen({
    Key? key,
    required this.discountProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    Theme.of(context).appBarTheme.backgroundColor ==
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
                    Navigator.pushNamed(context, RouteName.imageView,
                        arguments:
                            'http://146.190.207.16:3000/${discountProduct.media.media}');
                  },
                  child: CachedNetworkImage(
                    imageUrl:
                        'http://146.190.207.16:3000/${discountProduct.media.media}',
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
                          MyPermissionStatus.loading) {}
                      if (state.myPermissionStatus ==
                          MyPermissionStatus.success) {
                        BlocProvider.of<MapCubit>(context).fetchAddress(
                          latLongModel: state.latLongModel!,
                          kind: "house",
                        );
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CheckOutScreen(
                              latLong: state.latLongModel!,
                              productId: discountProduct.id,
                              isDiscount: true,
                            ),
                          ),
                        );
                      }
                      if (state.myPermissionStatus == MyPermissionStatus.fail) {
                        showInfoSnackBar(context, "Permission not found");
                      }
                    },
                    child: DiscountProductInfo(
                      product: discountProduct,
                      onTap: () {
                        BlocProvider.of<LocationPermissionCubit>(context)
                            .fetchCurrentLocation();
                        showDialog(
                          barrierDismissible: false,
                          builder: (context) => LoadingDialog(
                            widget: Lottie.asset(AppImages.locationLoading),
                          ),
                          context: context,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
