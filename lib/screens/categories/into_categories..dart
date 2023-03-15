import 'dart:ffi';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:ishonch/utils/my_utils.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class IntoCategories extends StatefulWidget {
  final List<CategoryModel> data;

  const IntoCategories({super.key, required this.data});

  @override
  State<IntoCategories> createState() => _IntoCategoriesState();
}

class _IntoCategoriesState extends State<IntoCategories> {
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xFFFFFFFF),
          title: Text(
            'Categories'.tr(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width(context) * 0.06,
                    vertical: height(context) * 0.012),
                child: ZoomTapAnimation(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.productByCategory,
                        arguments: widget.data[index]);
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width(context) * 0.04),
                      height: height(context) * 0.15,
                      width: width(context),
                      decoration: BoxDecoration(
                        color: const Color(0XFFF2F2F2),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(-1, -1),
                            color: Colors.grey,
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.grey,
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            offset: Offset(1, -1),
                            color: Colors.grey,
                            blurRadius: 2,
                          ),
                          BoxShadow(
                            offset: Offset(-1, 1),
                            color: Colors.grey,
                            blurRadius: 2,
                          ),
                        ],
                        borderRadius:
                            BorderRadius.circular(width(context) * 0.04),
                      ),
                      child: categoryDecoretion(index)),
                ));
          },
        ));
  }

  categoryDecoretion(index) {
    index % 2 == 0 ? isTrue = false : isTrue = true;
    return Container(
        height: height(context) * 0.15,
        width: width(context) * 0.54,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter:
                    const ColorFilter.mode(Color(0XFFF2F2F2), BlendMode.darken),
                alignment:
                    isTrue ? Alignment.centerLeft : Alignment.centerRight,
                image: NetworkImage(
                    'http://146.190.207.16:3000/${widget.data[index].categoryImage}'))),
        child: Column(
          crossAxisAlignment:
              isTrue ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) * 0.038,
            ),
            Text(
              widget.data[index].categoryName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: height(context) * 0.003,
            ),
            Text(
              '${widget.data[index].product.length} Product'.tr(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
