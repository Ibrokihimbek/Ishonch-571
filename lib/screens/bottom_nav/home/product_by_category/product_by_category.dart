import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/bottom_nav/home/product_by_category/widgets/product_item.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/text_style.dart';

class ProductByCategory extends StatelessWidget {
  final CategoryModel data;
  const ProductByCategory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.categoryName,
          style: fontRobotoW500(
            appcolor: AppColors.black,
          ).copyWith(fontSize: 32.sp),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: 800.h,
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          children: List.generate(
            data.product.length,
            (index) => ProductByCategoryItem(
              productName: data.product[index].productName,
              productPrice: data.product[index].productPrice.toString(),
              productImage:
                  'https://www.infinixmobility.com/fileadmin/assets/images/product/list/hot10.jpg',
              // data.product[index].media.media,,
              onTap: () {
                Navigator.pushNamed(context, RouteName.productDetail);
              },
            ),
          ),
        ),
      ),
    );
  }
}
