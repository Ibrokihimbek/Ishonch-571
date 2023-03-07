import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/product_detail/widgets/draw_stars_widget.dart';
import 'package:ishonch/screens/product_detail/widgets/text_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: Column(
        children: [
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            height: 300.h,
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
          const Spacer(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 24.w, right: 24.w).w,
            height: 370.h,
            decoration: BoxDecoration(
              color: Colors.white,
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
                Row(
                  children: [
                    DrawStarWidget(itemCount: 5),
                    TextWidget(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      text: "(270 Review)",
                    ),
                    Spacer(),
                    TextWidget(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      text: "Avaliabel in stok",
                    ),
                  ],
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
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 30.h, left: 24.w, right: 24.w).w,
        child: Container(
          height: 50.h,
          padding: EdgeInsets.only(left: 24.w, right: 24.w).w,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30).r,
            color: Colors.black87,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_shopping_cart, color: Colors.white, size: 30.sp),
              SizedBox(width: 20.w),
              Text(
                "Add to card",
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
