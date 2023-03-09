import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.isActive,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final bool isActive;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          // shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Text(
          buttonText,
          style: fontRobotoW600(appcolor: AppColors.white).copyWith(
            fontSize: 18.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
