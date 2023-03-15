import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';

class AppliancesCharacter extends StatelessWidget {
  final ProductModel product;
  const AppliancesCharacter({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        infoMethod(
          fieldName: "rang:".tr(),
          product: product.appliances.color,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: "energiya_iste'moli:".tr(),
          product: product.appliances.classenergopotrebleniya,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'kafolat:'.tr(),
          product: product.appliances.warranty,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'muzlatgichning_joylashuvi:'.tr(),
          product: product.appliances.freezerLocation,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'sigimi:'.tr(),
          product: product.appliances.capacity,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'chuqurlik_sm:'.tr(),
          product: product.appliances.depthCm,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'diagonal:'.tr(),
          product: product.appliances.diagonal,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'muzlatgich_ovozi:'.tr(),
          product: product.appliances.freezerVolumeL,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'balandligi_sm:'.tr(),
          product: product.appliances.heightCm,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'kengligi_sm:'.tr(),
          product: product.appliances.widthCm,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'ovozi:'.tr(),
          product: product.appliances.volumeL,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'sovutgich_kamerasining_hajmi:'.tr(),
          product: product.appliances.volumeOfRefrigeratorCompartmentL,
          context: context,
        ),
      ],
    );
  }

  Row infoMethod(
      {required String fieldName,
      required String product,
      required BuildContext context}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).cardColor),
          ),
          width: 130.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w).r,
          height: 40.h,
          child: Center(
            child: Text(
              fieldName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).cardColor),
          ),
          width: 150.w,
          padding: EdgeInsets.symmetric(horizontal: 12.w).r,
          height: 40.h,
          child: Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: product.substring(
                      0,
                      product.length > 25 ? 25 : product.length,
                    ),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  TextSpan(
                    text: product.length > 25 ? "..." : "",
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
