import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/bottom_nav/home/view/category/category_widget.dart';
import 'package:ishonch/screens/bottom_nav/home/view/category/widget/into_categories..dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/arrivals_widget.dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/widget/all_product/all_product.dart';
import 'package:ishonch/screens/bottom_nav/home/view/widget/discount_widget.dart';
import 'package:ishonch/utils/my_utils.dart';

class HomeWidget extends StatelessWidget {
  final List<CategoryModel> data;

  const HomeWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: true,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 12),
          DiscountWidget(),
          SizedBox(
            height: height(context) * 0.02,
          ),
          titleWidget(
              context, 'Kategoriyalar'.tr(), IntoCategories(data: data)),
          CategoryWidget(data: data),
          titleWidget(context, 'All Products', const AllProduct()),
          SizedBox(
            height: height(context) * 0.019,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context) * 0.03,
            ),
            child: const ArrivalWidget(),
          )
        ],
      ),
    );
  }

  titleWidget(context, title, page) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context) * 0.055),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => page));
              },
              child: Text(
                'Davomi'.tr(),
                style: const TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
