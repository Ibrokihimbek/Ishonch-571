import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/my_utils.dart';

class DiscountWidget extends StatelessWidget {
  final List<CategoryModel> data;

  const DiscountWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: width(context) * 0.055),
      height: height(context) * 0.19,
      width: width(context),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(left: width(context) * 0.05),
            height: height(context) * 0.18,
            width: width(context) * 0.74,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.centerRight,
                  image: NetworkImage(
                      'https://pngimg.com/uploads/iphone_12/iphone_12_PNG25.png')),
              borderRadius: BorderRadius.circular(height(context) * 0.025),
              color: AppColors.grey.withOpacity(0.4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height(context) * 0.02,
                ),
                Text('50% Off',
                    style: Theme.of(context).textTheme.headlineMedium),
                const Text(
                  'On everything',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height(context) * 0.01,
                ),
                const Text('Code:FSCREATION'),
                SizedBox(
                  height: height(context) * 0.016,
                ),
                Container(
                  height: height(context) * 0.034,
                  width: width(context) * 0.22,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: const Center(
                      child: Text(
                    'Get now',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: width(context) * 0.05,
          );
        },
      ),
    );
  }
}
