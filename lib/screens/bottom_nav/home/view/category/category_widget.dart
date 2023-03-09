import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
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
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteName.productByCategory, arguments: data[index]);
              },
              child: Column(
                children: [
                  Container(
                    height: height(context) * 0.09,
                    width: width(context) * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          scale: 4,
                        colorFilter: ColorFilter.mode(Color(0xFFDEE6E3).withOpacity(0.5), BlendMode.darken),
                          image: NetworkImage( "http://146.190.207.16:3000/${data[index].categoryImage}")),
                        border: Border.all(color: Colors.black26),
                        color: const Color(0xFFDEE6E3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(height: height(context) * 0.005),
                  Text(data[index].categoryName)
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(width: width(context) * 0.03);
          },
        ));
  }
}
