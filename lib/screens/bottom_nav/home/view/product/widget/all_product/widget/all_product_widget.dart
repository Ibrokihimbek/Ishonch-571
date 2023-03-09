import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/screens/bottom_nav/home/view/product/widget/product_widget.dart';
import 'package:ishonch/utils/my_utils.dart';

class AllProductwidget extends StatefulWidget {
  final List<ProductModel> data;
  
  const AllProductwidget({super.key, required this.data});

  @override
  State<AllProductwidget> createState() => _AllProductwidgetState();
}

class _AllProductwidgetState extends State<AllProductwidget> {
  bool favoriteTrue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context)*0.04),
      child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: height(context)*0.27
              ),
            physics: const BouncingScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: height(context) * 0.2,
                        width: width(context) * 0.41,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/iphone.png')),
                            color: const Color(0xFFDEE6E3).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Positioned(
                          left: width(context) * 0.31,
                          top: height(context) * 0.14,
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
          ),
    );
  }
}