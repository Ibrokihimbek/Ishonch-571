import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/all_products/all_product.dart';
import 'package:ishonch/screens/bottom_nav/home/widgets/all_categories_title.dart';
import 'package:ishonch/screens/bottom_nav/home/widgets/categories_list.dart';
import 'package:ishonch/screens/categories/into_categories..dart';
import 'package:ishonch/utils/my_utils.dart';
import 'products_grid_home.dart';
import 'discount_widget.dart';

class HomeWidget extends StatelessWidget {
  final List<CategoryModel> data;

   const HomeWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 12)),
        SliverPersistentHeader(
            delegate: DiscountWidget(screenHeight: height(context))),
        SliverToBoxAdapter(child: SizedBox(height: height(context) * 0.02)),
        SliverPersistentHeader(
          delegate: AllCategoriesTitle(
            screenHeight: height(context),
            screenWidth: width(context),
            title: 'Kategoriyalar'.tr(),
            page: IntoCategories(data: data),
          ),
        ),
        SliverPersistentHeader(
          delegate: CategoriesList(
            screenHeight: height(context),
            screenWidth: width(context),
            data: data,
          ),
        ),
        SliverPersistentHeader(
          delegate: AllCategoriesTitle(
            screenHeight: height(context),
            screenWidth: width(context),
            title: 'Barcha_produktlar'.tr(),
            page: AllProduct(),
          ),
        ),
        ProductsGridWidget(),
      ],
    );
  }
}
