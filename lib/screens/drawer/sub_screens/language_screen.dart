import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/data/models/language/language_model.dart';
import 'package:ishonch/screens/drawer/widgets/language_widget.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLang = 0;
  @override
  Widget build(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'en':
        selectedLang = 0;
        break;
      case 'ru':
        selectedLang = 1;
        break;
      case 'uz':
        selectedLang = 2;
        break;
      default:
    }
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
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: Container(
        color: AppColors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tilni Tanlash".tr(),
              style: fontRobotoW700(appcolor: AppColors.black)
                  .copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 24.h),
            // ListView.separated(
            //   separatorBuilder: (context, index) => SizedBox(height: 20.h),
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: LanguageModel.languages.length,
            //   itemBuilder: (context, index) {
            //     return LanguageWidget(
            //       selectedLang: selectedLang,
            //       i: index,
            //       languageModel: LanguageModel.languages[index],
            //       onTap: () {
            //         selectedLang = index;
            //         if (index == 0) {
            //         } else if (index == 1) {
            //           context.setLocale(const Locale("ru", "RU"));
            //         } else {
            //           context.setLocale(const Locale("uz", "UZ"));
            //         }
            //         setState(() {});
            //       },
            //     );
            //   },
            // )
            ListView(
              shrinkWrap: true,
              children: [
                ZoomTapAnimation(
                    onTap: () {
                      context.setLocale(const Locale("en", "EN"));
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24).r,
                        decoration: BoxDecoration(
                            boxShadow: selectedLang == 0
                                ? []
                                : [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2.5,
                                        blurRadius: 8)
                                  ],
                            borderRadius: BorderRadius.circular(24.r),
                            color: selectedLang == 0
                                ? AppColors.black
                                : AppColors.white),
                        height: 64.h,
                        child: Row(children: [
                          Container(
                            height: 44.h,
                            width: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: const DecorationImage(
                                    image: AssetImage("assets/images/usa.png"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "English",
                            style: fontRobotoW300(
                                    appcolor: selectedLang == 0
                                        ? AppColors.white
                                        : AppColors.black)
                                .copyWith(fontSize: 14.sp),
                          ),
                          const Spacer(),
                          Container(
                              width: 10.w,
                              height: 10.h,
                              padding: const EdgeInsets.all(2).r,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedLang == 0
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                  width: 7.w,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  )))
                        ]))),
                SizedBox(height: 12.h),
                ZoomTapAnimation(
                    onTap: () {
                      context.setLocale(const Locale("ru", "RU"));
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24).r,
                        decoration: BoxDecoration(
                            boxShadow: selectedLang == 1
                                ? []
                                : [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2.5,
                                        blurRadius: 8)
                                  ],
                            borderRadius: BorderRadius.circular(24.r),
                            color: selectedLang == 1
                                ? AppColors.black
                                : AppColors.white),
                        height: 64.h,
                        child: Row(children: [
                          Container(
                            height: 44.h,
                            width: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/russia.png"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "Russian",
                            style: fontRobotoW300(
                                    appcolor: selectedLang == 1
                                        ? AppColors.white
                                        : AppColors.black)
                                .copyWith(fontSize: 14.sp),
                          ),
                          const Spacer(),
                          Container(
                              width: 10.w,
                              height: 10.h,
                              padding: const EdgeInsets.all(2).r,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedLang == 1
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                  width: 7.w,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  )))
                        ]))),
                SizedBox(height: 12.h),
                ZoomTapAnimation(
                    onTap: () {
                      context.setLocale(const Locale("uz", "UZ"));
                      setState(() {});
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24).r,
                        decoration: BoxDecoration(
                            boxShadow: selectedLang == 2
                                ? []
                                : [
                                    const BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 2.5,
                                        blurRadius: 8)
                                  ],
                            borderRadius: BorderRadius.circular(24.r),
                            color: selectedLang == 2
                                ? AppColors.black
                                : AppColors.white),
                        height: 64.h,
                        child: Row(children: [
                          Container(
                            height: 44.h,
                            width: 44.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/uzbek.png"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            "Uzbek",
                            style: fontRobotoW300(
                                    appcolor: selectedLang == 2
                                        ? AppColors.white
                                        : AppColors.black)
                                .copyWith(fontSize: 14.sp),
                          ),
                          const Spacer(),
                          Container(
                              width: 10.w,
                              height: 10.h,
                              padding: const EdgeInsets.all(2).r,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedLang == 2
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                  width: 7.w,
                                  height: 7.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  )))
                        ]))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
