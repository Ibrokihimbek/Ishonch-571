import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';

class NotebookCharacterDiscount extends StatelessWidget {
  final Discount product;
  const NotebookCharacterDiscount({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        infoMethod(
          fieldName: "rang:".tr(),
          product: product.notebook.color,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'ekran'.tr(),
          product: product.notebook.display,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'xotira_RAM:'.tr(),
          product: product.notebook.memoryRam,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'xotira_ROM:'.tr(),
          product: product.notebook.memoryRom,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'kafolat:'.tr(),
          product: product.notebook.warranty,
          context: context,
        ),
        SizedBox(height: 5.h),
        infoMethod(
          fieldName: 'grafik_karta:'.tr(),
          product: product.notebook.videoCard,
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
