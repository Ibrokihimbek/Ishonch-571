import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/cubit/location_permission/location_permission_cubit.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/discount_product/widgets/discount_product_info.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/check_out_screen.dart';
import 'package:ishonch/screens/widgets/dialog_widget.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:lottie/lottie.dart';

class DiscountProductDetailScreen extends StatelessWidget {
  final Discount discountProduct;

  const DiscountProductDetailScreen({
    Key? key,
    required this.discountProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.imageView,
                        arguments:
                            'http://146.190.207.16:3000/${discountProduct.media.media}');
                  },
                  child: Center(
                    child: Image.network(
                      'http://146.190.207.16:3000/${discountProduct.media.media}',
                    ),
                  ),
                ),
                Positioned(
                  left: 10.w,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppImages.iconBackArrow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          BlocListener<LocationPermissionCubit, LocationPermissionState>(
            listener: (context, state) {
              if (state.myPermissionStatus == MyPermissionStatus.Loading) {}
              if (state.myPermissionStatus == MyPermissionStatus.Success) {
                BlocProvider.of<MapCubit>(context).fetchAddress(
                  latLongModel: state.latLongModel!,
                  kind: "house",
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckOutScreen(
                      latLong: state.latLongModel!,
                      productId: discountProduct.id,
                    ),
                  ),
                );
              }
              if (state.myPermissionStatus == MyPermissionStatus.Fail) {
                showInfoSnackBar(context, "Permission not found");
              }
            },
            child: Expanded(
              child: DiscountProductInfo(
                product: discountProduct,
                onTap: () {
                  BlocProvider.of<LocationPermissionCubit>(context)
                      .fetchCurrentLocation();
                  showDialog(
                    builder: (context) => LoadingDialog(
                      widget: Lottie.asset(AppImages.locationLoading),
                    ),
                    context: context,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
