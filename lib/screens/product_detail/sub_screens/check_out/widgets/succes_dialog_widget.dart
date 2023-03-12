import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/widgets/global_button.dart';

Future successDialog(
    {required BuildContext context, required imagePath, required desc}) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: SizedBox(
            width: 320.w,
            height: 446.h,
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  scale: 2.5,
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Text(
                //   tr('patient_details_screen.successfull',),
                //   style: MyTextStyle.sfProSemiBold
                //       .copyWith(color: MyColors.primary, fontSize: 29.sp),
                // ),
                SizedBox(
                  height: 8.h,
                ),
                Text(tr(desc)),
                SizedBox(
                  height: 24.h,
                ),
                GlobalButton(
                  isActive: true,
                  buttonText: 'ok',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteName.bottomNavigation, (route) => false);
                  },
                )
              ],
            ),
          ),
        );
      });
}
