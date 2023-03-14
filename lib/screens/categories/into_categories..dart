import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/screens/app_router.dart';
import 'package:ishonch/screens/widgets/global_appbar.dart';
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
        appBar: GlobalAppBar(title: 'Categories'),
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
                      height: height(context) * 0.15,
                      width: width(context),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            blurRadius: 6,
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
      width: width(context) * 0.64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width(context) * 0.04),
          topRight: Radius.circular(width(context) * 0.04),
          bottomLeft: Radius.circular(width(context) * 0.04),
          bottomRight: Radius.circular(width(context) * 0.04),
        ),
        image: DecorationImage(
          colorFilter:
              const ColorFilter.mode(Color(0XFFF2F2F2), BlendMode.darken),
          alignment: isTrue ? Alignment.centerLeft : Alignment.centerRight,
          image: NetworkImage(
              'http://146.190.207.16:3000/${widget.data[index].categoryImage}'),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: Column(
          crossAxisAlignment:
              isTrue ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) * 0.038,
            ),
            Text(
              widget.data[index].categoryName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: height(context) * 0.003,
            ),
            Text(
              '${widget.data[index].product.length} Product',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
