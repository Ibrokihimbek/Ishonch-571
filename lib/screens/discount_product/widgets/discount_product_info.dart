import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/screens/discount_product/widgets/appliances_character_discount.dart';
import 'package:ishonch/screens/discount_product/widgets/notebook_character_discount.dart';
import 'package:ishonch/screens/discount_product/widgets/phone_character_discount.dart';
import 'package:ishonch/screens/widgets/global_button.dart';

class DiscountProductInfo extends StatelessWidget {
  final Discount product;
  final VoidCallback onTap;
  const DiscountProductInfo({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
            top: 10.h,
            bottom: 80.h,
          ).r,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 20.sp),
                  product.productName,
                ),
                SizedBox(height: 20.h),
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18.sp),
                  "Narxi".tr(),
                ),
                SizedBox(height: 5.h),
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 18.sp),
                  '${product.productPrice} ${product.currency.currencyName}'
                      .toString(),
                ),
                SizedBox(height: 20.h),
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16.sp),
                  "tavsif".tr(),
                ),
                SizedBox(height: 5.h),
                Text(
                  product.description,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 15.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 16.sp),
                  "malumotlar".tr(),
                ),
                SizedBox(height: 5.h),
                product.phoneCharacterics != 0
                    ? PhoneCharacterDiscount(product: product)
                    : product.notebookCharacterics != 0
                        ? NotebookCharacterDiscount(product: product)
                        : product.appliancesCharacterics != 0
                            ? AppliancesCharacterDiscount(product: product)
                            : const SizedBox(),
              ],
            ),
          ),
        ),
        Positioned(
          left: 12.w,
          right: 12.w,
          bottom: 16.h,
          child: GlobalButton(
            isActive: true,
            buttonText: "buyurtma_berish".tr(),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
