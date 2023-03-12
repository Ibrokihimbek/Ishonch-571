import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/cubit/discount/discount_cubit.dart';
import 'package:ishonch/cubit/discount/discount_state.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'discount_shimmer.dart';

class DiscountWidget extends   SliverPersistentHeaderDelegate {
  final double screenHeight;
  DiscountWidget({required this.screenHeight});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<DiscountCubit, DiscountState>(
      builder: (context, state) {
        return state is GettingDiscountInProgress
            ? const Center(
            child: ShimmerWidgetByDiscount()
        )
            : state is GettingDiscountInSuccess
            ? SizedBox(
          height: 200,
          width: width(context),
          child: CarouselSlider(
            items: List.generate(
              state.discount.length,
                  (index) => Container(
                padding: EdgeInsets.only(left: width(context) * 0.05),
                height: screenHeight * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(screenHeight * 0.025),
                  color: const Color(0xFFDEE6E3).withOpacity(0.7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Text(
                          '${state.discount[index].discount}% Off',
                          style: fontRobotoW500(
                              appcolor: AppColors.black)
                              .copyWith(
                            fontSize: 28.sp,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: state
                                    .discount[index].productName
                                    .substring(
                                  0,
                                  state.discount[index].productName
                                      .length >
                                      18
                                      ? 18
                                      : state.discount[index]
                                      .productName.length,
                                ),
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(
                                text: state.discount[index]
                                    .productName.length >
                                    18
                                    ? "..."
                                    : "",
                                style: const TextStyle(
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 0.01,
                        ),
                        Text(
                          'Price: ${state.discount[index].productPrice} ${state.discount[index].currency.currencyName}',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight * 0.016
                        ),
                        ZoomTapAnimation(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.discountProductDetail,
                              arguments: state.discount[index],
                            );
                          },
                          child: Container(
                            height: screenHeight * 0.034,
                            width: screenHeight * 0.22,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                                child: Text(
                                  'Get now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: REdgeInsets.only(
                        right: 12.w,
                        top: 12.h,
                        bottom: 12.h,
                      ).r,
                      width: 120.w,
                      height: 150.h,
                      child: Image.network(
                        'http://146.190.207.16:3000/${state.discount[index].media.media}',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //carouselController: buttonCarouselController,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              initialPage: 0,
            ),
          ),
        )
            : state is GettingDiscountInFailury
            ? Center(
          child: Lottie.asset(
            AppImages.lottieItem,
            width: 200.w,
          ),
        )
            : const SizedBox();
      },
    );
  }

  @override
  double get maxExtent => screenHeight*0.18;

  @override
  double get minExtent => screenHeight*0.18;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
