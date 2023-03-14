import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/text_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Haqimizda".tr()),
      body: Container(
        margin: const EdgeInsets.all(10).r,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30).r,
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).shadowColor),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            SizedBox(
              width: 132.5.w,
              height: 68.64.h,
              child: Image.asset(

                Theme.of(context).dialogBackgroundColor == Colors.white
                    ? AppImages.imageLogo
                    : AppImages.imageLogoLight,

              ),
            ),
            SizedBox(
              child: Text(
                'Ishonch 571',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Ishonch 571 - bu professional elektron tijorat platformasi. Bu yerda biz sizga faqat qiziqarli kontentni taqdim etamiz, ular sizga juda yoqadi. Biz ishonchlilik va xaridlarga e'tibor qaratgan holda, sizga eng yaxshi elektron tijoratni taqdim etishga bag'ishlanganmiz. Biz elektron tijoratga bo'lgan ishtiyoqimizni rivojlanayotgan onlayn veb-saytga aylantirish ustida ishlamoqdamiz. Umid qilamizki, bizning elektron tijoratimiz biz ularni sizga taklif qilganimizdek sizga ham yoqadi."
                  .tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
