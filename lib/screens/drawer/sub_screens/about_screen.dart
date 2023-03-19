import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/service/lat_long/lat_long.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: "Haqimizda".tr()),
      body: Container(
        margin: const EdgeInsets.all(10).r,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 30).r,
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
            Padding(
              padding: const EdgeInsets.all(16).r,
              child: Text(
                "about_text".tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  child: Text(
                    'bizning_manzil'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Buyuk Ipak yo'li, Bekabad, Bekabad, Tashkent Region, Uzbekistan",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  trailing: ZoomTapAnimation(
                    child: Icon(
                      Icons.location_on,
                      size: 32.sp,
                      color: Theme.of(context).cardColor,
                    ),
                    onTap: () {
                      LatLong.openMap(40.213734, 69.265442);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  child: Text(
                    'telefon_raqam'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Abdulaziz\n+998 90 024 94 24",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  trailing: ZoomTapAnimation(
                    child: Icon(
                      Icons.phone,
                      size: 32.sp,
                      color: Theme.of(context).cardColor,
                    ),
                    onTap: () async {
                      final Uri phoneUri =
                          Uri(scheme: "tel", path: '+998900249424');
                      try {
                        if (await canLaunchUrl(phoneUri)) {
                          await launchUrl(phoneUri);
                        }
                      } catch (error) {
                        throw ("Cannot dial");
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
