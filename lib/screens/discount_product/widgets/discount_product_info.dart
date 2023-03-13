import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/discount/discount_model.dart';
import 'package:ishonch/screens/product_detail/widgets/text_widget.dart';
import 'package:ishonch/screens/widgets/global_button.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';

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
            bottom: 80.h
          ).r,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.w).w,
              topRight: Radius.circular(25.w).w,
            ),
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              TextWidget(
                textStyle: fontRobotoW700(appcolor: AppColors.black),
                text: product.productName,
              ),
              SizedBox(height: 20.h),
              TextWidget(
                textStyle: fontRobotoW400(appcolor: AppColors.black),
                text: "Total Price",
              ),
              SizedBox(height: 5.h),
              TextWidget(
                textStyle: fontRobotoW700(appcolor: AppColors.black),
                text:
                    '${product.productPrice} ${product.currency.currencyName}'
                        .toString(),
              ),
              SizedBox(height: 20.h),
              TextWidget(
                textStyle: fontRobotoW600(appcolor: AppColors.black)
                    .copyWith(fontSize: 14.sp),
                text: "Description",
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.description,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 20.h),
              TextWidget(
                textStyle: fontRobotoW600(appcolor: AppColors.black)
                    .copyWith(fontSize: 16.sp),
                text: "Ma'lumotlar",
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.color,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.display,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.memoryRam,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.memoryRom,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.videoCard,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 5.h),
              TextWidget(
                text: product.phone.warranty,
                textStyle: fontRobotoW400(appcolor: AppColors.black)
                    .copyWith(fontSize: 15.sp),
              ),
            ],
          ),
        ),
        Positioned(
          left: 12.w,
          right: 12.w,
          bottom: 16.h,
          child: GlobalButton(
            isActive: true,
            buttonText: "Buyurtma berish",
            onTap:  onTap,
          ),
        ),
      ],
    );
  }
}
