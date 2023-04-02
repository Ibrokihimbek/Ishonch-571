import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ImageView extends StatelessWidget {
  final String imageUrl;
  const ImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              PhotoView(
                imageProvider: NetworkImage(imageUrl),
                backgroundDecoration: BoxDecoration(
                  color:
                      Theme.of(context).scaffoldBackgroundColor == Colors.white
                          ? AppColors.white
                          : AppColors.black,
                ),
              ),
              Positioned(
                top: 12.h,
                left: 12.w,
                child: ZoomTapAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    Theme.of(context).scaffoldBackgroundColor == AppColors.white
                        ? AppImages.iconBackArrow
                        : AppImages.iconBackArrowLight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
