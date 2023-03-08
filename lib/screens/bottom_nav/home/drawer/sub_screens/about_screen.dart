import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8).r,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10).r,
              width: 10.w,
              height: 10.h,
              decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: SvgPicture.asset(
                "assets/svg/arrow_back.svg",
                width: 10.w,
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.black),
        title: Text(
          "About Us",
          style: fontRobotoW700(appcolor: AppColors.black)
              .copyWith(fontSize: 22.sp),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10).r,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30).r,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            SizedBox(
              width: 132.5.w,
              height: 68.64.h,
              child: Image.asset(AppImages.imageLogo),
            ),
            SizedBox(
              child: Text(
                'Ishonch 571',
                style: fontRobotoW700(appcolor: AppColors.black)
                    .copyWith(fontSize: 24.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Ishonch 571 is a Professional eCommerce Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of eCommerce, with a focus on dependability and buying. We're working to turn our passion for eCommerce into a booming online website. We hope you enjoy our eCommerce as much as we enjoy offering them to you.",
              style: fontRobotoW700(appcolor: AppColors.black)
                  .copyWith(fontSize: 18.sp),
            )
          ],
        ),
      ),
    );
  }
}
