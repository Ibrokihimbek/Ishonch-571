import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/app_image.dart';
import '../../app_router.dart';
import '../../product_by_category/widgets/product_item.dart';

class AllProductsScreen extends StatelessWidget {
  final List<ProductModel> data;

  const AllProductsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImages.lotieDeliveryInTime),
              Text('The products are not available for now'.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          )
        : GridView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            children: List.generate(
              data.length,
              (index) => ProductByCategoryItem(
                productId: data[index].id,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.productDetail,
                    arguments: data[index].id,
                  );
                },
              ),
            ),
          );
  }
}
