import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/discount_product/widgets/discount_product_info.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/check_out_screen.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info_shimmer.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

import '../widgets/global_functsions.dart';

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
                    Navigator.pushNamed(
                        context, RouteName.imageView,
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
          Expanded(
            child: DiscountProductInfo(
              product:  discountProduct,
              onTap: () {
                getLocationPermission(context);

              },
            ),
          ),
        ],
      )
    );
  }
}