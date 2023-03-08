import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/language/language_model.dart';
import 'package:ishonch/utils/text_style.dart';

import '../../../../../utils/app_colors.dart';

class LanguageWidget extends StatelessWidget {
  LanguageModel languageModel;
  VoidCallback onTap;
  int selectedLang;
  int i;
  LanguageWidget(
      {super.key,
      required this.languageModel,
      required this.onTap,
      required this.selectedLang,
      required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24).r,
        decoration: BoxDecoration(
            boxShadow: selectedLang == i
                ? []
                : [
                    const BoxShadow(
                        color: Colors.grey, spreadRadius: 2.5, blurRadius: 8)
                  ],
            borderRadius: BorderRadius.circular(24.r),
            color: selectedLang == i ? AppColors.black : AppColors.white),
        height: 64.h,
        child: Row(
          children: [
            Container(
              height: 44.h,
              width: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                      image: AssetImage(languageModel.ImgUrl),
                      fit: BoxFit.cover)),
            ),
            SizedBox(width: 12.w),
            Text(
              languageModel.Name,
              style: fontRobotoW300(
                      appcolor:
                          selectedLang == i ? AppColors.white : AppColors.black)
                  .copyWith(fontSize: 14.sp),
            ),
            const Spacer(),
            Container(
              width: 10.w,
              height: 10.h,
              padding: const EdgeInsets.all(2).r,
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedLang == i ? AppColors.white : AppColors.black,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Container(
                width: 7.w,
                height: 7.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
