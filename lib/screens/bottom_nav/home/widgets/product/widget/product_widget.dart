import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/utils/my_utils.dart';

import '../../../../../app_router.dart';
import '../../../../../product_by_category/widgets/product_item.dart';

class ProductWidget extends StatelessWidget {
  final List<ProductModel> data;
  ProductWidget({super.key, required this.data});

  bool favoriteTrue = true;
  int box = -1;
  double productSize = 0.27;
  int number = 1;
 
  @override
  Widget build(BuildContext context) {
    if(data.length % 2 == 0){
      number = (((data.length)~/2)).toInt();
    } else if(data.length % 2 != 0) {
      number = (((data.length)~/2)+1).toInt();
    }
    return SizedBox(
        height: height(context) * productSize*number,
        width: width(context),
        child: GridView(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          children: List.generate(
            data.length,
                (index) => ProductByCategoryItem(
              productId: data[index].id,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.productDetail,
                  arguments: data[index],
                );
              },
            ),
          ),
        ),);
  }
}

favorite(context, isTrue) {
  return Container(
    height: height(context) * 0.04,
    width: height(context) * 0.04,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isTrue ? Colors.transparent : Colors.red)),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: height(context) * 0.03,
        width: height(context) * 0.03,
        decoration: BoxDecoration(
            color: isTrue ? Colors.black : Colors.red,
            border: Border.all(color: Colors.grey[300]!),
            shape: BoxShape.circle),
        child: Icon(
          isTrue ? Icons.favorite_outline : Icons.favorite,
          color: isTrue ? Colors.white : Colors.white,
          size: 12,
        ),
      ),
    ),
  );
}
