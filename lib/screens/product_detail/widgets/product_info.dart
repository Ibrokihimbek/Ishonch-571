import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/screens/product_detail/widgets/appliances_character.dart';
import 'package:ishonch/screens/product_detail/widgets/notebook_character.dart';
import 'package:ishonch/screens/product_detail/widgets/phone_character.dart';
import 'package:ishonch/screens/widgets/global_button.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const ProductInfo({
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
            top: 24.h,
            bottom: 100.h,
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
                  "Price",
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
                  "Description",
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
                  "Ma'lumotlar",
                ),
                SizedBox(height: 10.h),
                product.phoneCharacterics != 0
                    ? PhoneCharacter(product: product)
                    : product.notebookCharacterics != 0
                        ? NotebookCharacter(product: product)
                        : product.appliancesCharacterics != 0
                            ? AppliancesCharacter(product: product)
                            : const SizedBox(),
              ],
            ),
          ),
        ),
        Positioned(
          left: 12.w,
          right: 12.w,
          bottom: 24.h,
          child: GlobalButton(
            isActive: true,
            buttonText: "Buyurtma berish",
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
