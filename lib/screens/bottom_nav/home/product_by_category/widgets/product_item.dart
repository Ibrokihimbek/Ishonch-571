import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductByCategoryItem extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final VoidCallback onTap;
  const ProductByCategoryItem({
    super.key,
    required this.onTap,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 4,
                offset: const Offset(4, 2),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            color: AppColors.white),
        margin: const EdgeInsets.all(12).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Image.network(productImage),
            ),
            SizedBox(height: 18.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r),
                ),
                color: AppColors.black,
              ),
              width: double.infinity,
              height: 80.h,
              child: Center(
                child: ListTile(
                  title: Text(
                    productName,
                    textAlign: TextAlign.center,
                    style: fontRobotoW600(
                      appcolor: AppColors.white,
                    ),
                  ),
                  subtitle: Text(
                    productPrice,
                    textAlign: TextAlign.center,
                    style: fontRobotoW300(appcolor: AppColors.white)
                        .copyWith(fontSize: 16.sp),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
