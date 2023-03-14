import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/product_by_category/widgets/product_item.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';

class ProductByCategory extends StatelessWidget {
  final CategoryModel data;
  const ProductByCategory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: data.categoryName),
      body: SizedBox(
        height: 800.h,
        child: data.product.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    AppImages.lotieDeliveryInTime,
                    width: 200.w,
                  ),
                  Text(
                    'Hozircha_Mahsulotlar_mavjud_emas'.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              )
            : GridView(
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
