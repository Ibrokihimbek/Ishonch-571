import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/bottom_nav/home/product_by_category/widgets/product_item.dart';
import 'package:ishonch/screens/widgets/custom_appbar.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';

class ProductByCategory extends StatelessWidget {
  final CategoryModel data;
  const ProductByCategory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: data.categoryName),
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
              productId: data.product[index].id,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.productDetail,
                  arguments: data.product[index].id,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
