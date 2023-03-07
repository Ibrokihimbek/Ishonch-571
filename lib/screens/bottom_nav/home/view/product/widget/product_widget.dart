import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/utils/my_utils.dart';

class ProductWidget extends StatefulWidget {
  final List<ProductModel> data;

  const ProductWidget({super.key, required this.data});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool favoriteTrue = true;
  int box = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height(context) * 0.24,
        width: width(context),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: widget.data.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height(context) * 0.18,
                      width: width(context) * 0.42,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/iphone.png')),
                          color: const Color(0xFFDEE6E3).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Positioned(
                        left: width(context) * 0.31,
                        top: height(context) * 0.13,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              favoriteTrue = !favoriteTrue;
                            });
                          },
                          child: favorite(context, favoriteTrue),
                        )),
                  ],
                ),
                SizedBox(height: height(context)*0.01,),
                Container(
                  alignment: Alignment.center,
                  width: width(context)*0.4,
                  height: height(context)*0.02,
                  child: Text(widget.data[index].productName)),
                Text('\$ ${widget.data[index].productPrice}.00'),

              ],
            );
          }),
          separatorBuilder: (context, index) {
            return SizedBox(width: width(context) * 0.05);
          },
        ));
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