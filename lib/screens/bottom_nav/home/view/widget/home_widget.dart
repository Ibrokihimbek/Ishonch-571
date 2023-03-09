import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/bottom_nav/home/view/category/category_widget.dart';
import 'package:ishonch/screens/bottom_nav/home/view/category/widget/into_categories..dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/arrivals_widget.dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/widget/all_product.dart';
import 'package:ishonch/screens/bottom_nav/home/view/widget/discount_widget.dart';
import 'package:ishonch/utils/my_utils.dart';

class HomeWidget extends StatelessWidget {
  final List<CategoryModel> data;

  const HomeWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: height(context) * 0.04,
          ),
          Container(
              padding: EdgeInsets.only(left: width(context) * 0.055),
              alignment: Alignment.topLeft,
              child: const Text('Welcome,',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800))),
          Container(
              padding: EdgeInsets.only(
                  left: width(context) * 0.055, top: height(context) * 0.005),
              alignment: Alignment.topLeft,
              child: const Text(
                'Our Fashions App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
          SizedBox(
            height: height(context) * 0.03,
          ),
          DiscountWidget(data: data),
          SizedBox(
            height: height(context) * 0.02,
          ),
          titleWidget(context, 'Categories', IntoCategories(data: data)),
          CategoryWidget(data: data),
          titleWidget(context, 'New Arrivals', const AllProduct()),
          Padding(
            padding: EdgeInsets.only(
                left: width(context) * 0.055, top: height(context) * 0.019),
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
              child: const Text(
                'View All',
                style: TextStyle(fontWeight: FontWeight.w500),
              )),
        ],
      ),
    );
  }
}
