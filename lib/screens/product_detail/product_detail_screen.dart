import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/cubit/mapping/map_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_cubit.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/data/models/helper/lat_long_model.dart';
import 'package:ishonch/screens/product_detail/sub_screens/check_out/check_out_screen.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info.dart';
import 'package:ishonch/screens/product_detail/widgets/product_info_shimmer.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:location/location.dart';
import 'package:lottie/lottie.dart';

class ProductDetailScreen extends StatefulWidget {
  final int product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  getLocationPermission() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    if (locationData.latitude != null) {
      if (!mounted) return;
      BlocProvider.of<MapCubit>(context).fetchAddress(
        latLongModel: LatLongModel(
          lat: locationData.latitude ?? 0.0,
          long: locationData.longitude ?? 0.0,
        ),
        kind: "house",
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckOutScreen(
            latLong: LatLongModel(
              lat: locationData.latitude ?? 0.0,
              long: locationData.longitude ?? 0.0,
            ),
          ),
        ),
      );
    }
    print("LONGITUDE:${locationData.longitude} AND ${locationData.latitude}");
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubitById(widget.product),
      child: BlocBuilder<ProductCubitById, ProductStateById>(
        builder: (context, state) {
          return Scaffold(
            body: state is GettingProductInProgress
                ? const Center(child: ProductInfoShimmer())
                : state is GettingProductInSuccess
                    ? Column(
                        children: [
                          SizedBox(height: 40.h),
                          Container(
                            width: double.infinity,
                            height: 300,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                SizedBox(height: 30.h),
                                Center(
                                  child: Image.network(
                                    'http://146.190.207.16:3000/${state.product.media.media}',
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
                            child: ProductInfo(
                              product: state.product,
                              onTap: () {
                                getLocationPermission();
                              },
                            ),
                          ),
                        ],
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
