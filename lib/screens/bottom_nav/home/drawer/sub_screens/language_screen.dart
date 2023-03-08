import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/data/models/language/language_model.dart';
import 'package:ishonch/screens/bottom_nav/home/drawer/widgets/language_widget.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLang = 0;
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
              "Select Language",
              style: fontRobotoW700(appcolor: AppColors.black)
                  .copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 24.h),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: LanguageModel.languages.length,
              itemBuilder: (context, index) {
                return LanguageWidget(
                  selectedLang: selectedLang,
                  i: index,
                  languageModel: LanguageModel.languages[index],
                  onTap: () {
                    setState(() {
                      selectedLang = index;
                      //LanguageModel.languages[index].IsSelected = true;
                    });
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
