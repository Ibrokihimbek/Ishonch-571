import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/utils/my_utils.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> data;

  const CategoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: width(context) * 0.055, top: height(context) * 0.01),
        width: width(context),
        height: height(context) * 0.15,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  height: height(context) * 0.09,
                  width: width(context) * 0.2,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(data[index].categoryImage)),
                ),
                SizedBox(height: height(context) * 0.005),
                Text(data[index].categoryName)
              ],
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(width: width(context) * 0.03);
          },
        ));
  }
}
