import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/cubit/discount/discount_cubit.dart';
import 'package:ishonch/cubit/discount/discount_state.dart';
import 'package:ishonch/data/models/discount_empty/discount_empty.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'discount_shimmer.dart';

class DiscountWidget extends SliverPersistentHeaderDelegate {
  final double screenHeight;
  DiscountWidget({required this.screenHeight});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<DiscountCubit, DiscountState>(
      builder: (context, state) {
        return state is GettingDiscountInProgress
            ? const Center(child: ShimmerWidgetByDiscount())
            : state is GettingDiscountInSuccess
                ? state.discount.isEmpty
                    ? SizedBox(
                        height: 200.h,
                        width: width(context),
                        child: CarouselSlider(
                          items: List.generate(
                            DiscountEmpty.discountEmpty.length,
                            (index) => Container(
                              height: screenHeight * 0.19,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).cardColor),
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 8.h),
                                  Image.asset(
                                    Theme.of(context).scaffoldBackgroundColor ==
                                            AppColors.white
                                        ? AppImages.imageLogo
                                        : AppImages.imageLogoLight,
                                    width: 100.w,
                                  ),
                                  Text(
                                    'Ishonch 571',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(fontSize: 18.sp),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 32.w)
                                            .r,
                                    child: Divider(
                                      thickness: 1,
                                      color: Theme.of(context).cardColor,
                                    ),
                                  ),
                                  Text(
                                    DiscountEmpty.discountEmpty[index].tr(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 16.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                          options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 2.0,
                            initialPage: 0,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        width: width(context),
                        child: CarouselSlider(
                          items: List.generate(
                            state.discount.length,
                            (index) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width(context) * 0.05),
                              height: screenHeight * 0.18,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.025),
                                color: const Color(0xFFDEE6E3).withOpacity(0.7),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "${state.discount[index].discount}% ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.copyWith(fontSize: 25.sp),
                                            ),
                                            TextSpan(
                                              text: 'Off'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.copyWith(fontSize: 25.sp),
                                            )
                                          ],
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
                                                  state
                                                              .discount[index]
                                                              .productName
                                                              .length >
                                                          18
                                                      ? 18
                                                      : state.discount[index]
                                                          .productName.length,
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                            TextSpan(
                                                text: state
                                                            .discount[index]
                                                            .productName
                                                            .length >
                                                        18
                                                    ? "..."
                                                    : "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium
                                                    ?.copyWith(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height(context) * 0.01,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Price: ".tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${state.discount[index].productPrice} ${state.discount[index].currency.currencyName}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.016),
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
                                          width: screenHeight * 0.18,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'get_now'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'http://146.190.207.16:3000/${state.discount[index].media.media}',
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
  double get maxExtent => screenHeight * 0.19;

  @override
  double get minExtent => screenHeight * 0.19;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
