import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_detail/widgets/draw_stars_widget.dart';
import 'package:ishonch/screens/product_detail/widgets/text_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            height: 300,
            color: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(height: 30.h),
                Positioned(
                  left: 10.w,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.sp,
                    ),
                  ),
                ),
                Center(
                  child: Image.network(
                    "https://fdn2.gsmarena.com/vv/pics/samsung/samsung-galaxy-a04s-3.jpg",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 10).w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.w).w,
                  topRight: Radius.circular(25.w).w,
                ),
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  TextWidget(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    text: 'Smartfon Samsung A04S 3/32 GB Green',
                  ),
                  SizedBox(height: 5.h),
                  TextWidget(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    text: "Clean 90 Triole Sneakers",
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 20,
                    width: 100,
                    child: Row(
                      children: [
                        const DrawStarWidget(itemCount: 2),
                        TextWidget(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          text: "(270 Review)",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextWidget(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    text: "Total Price",
                  ),
                  SizedBox(height: 5.h),
                  TextWidget(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    text: "1 655 000 so'm",
                  ),
                  SizedBox(height: 20.h),
                  TextWidget(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    text: "Description",
                  ),
                  SizedBox(height: 20.h),
                  TextWidget(
                    text:
                        "Powerful Octa-core processor for fast performance Galaxy A04s combines Octa-core processing power with up to 3GB of RAM for fast and efficient performance for the task at hand. Enjoy 32GB of internal storage and add up to 1TB more with microSD card. *RAM and internal memory capacity may vary by country.",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.only(bottom: 30.h, left: 24.w, right: 24.w, top: 15).w,
        child: ZoomTapAnimation(
          onTap: () {
            Navigator.pushNamed(context, RouteName.checkOut);
          },
          child: Container(
            height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).r,
              color: Theme.of(context).buttonTheme.colorScheme!.background
            ),
            child: Center(
              child: Text(
                "Go to checkout",
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
