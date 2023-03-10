import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubit/product_detail/product_detail_cubit.dart';
import '../../../../cubit/product_detail/product_detail_state.dart';
import '../../../../data/models/model_category/categories/product/product_model.dart';
import '../../../app_router.dart';
import 'notification_shimmer.dart';

// ignore: must_be_immutable
class NotificationCourseItem extends StatelessWidget {
  final String id;
  const NotificationCourseItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ID $id");
    return BlocProvider(
      create: (context) => ProductCubitById(id),
      child: BlocBuilder<ProductCubitById, ProductStateById>(
        builder: (context, state) {
          if (state is GettingProductInProgress) {
            return const NotificationShimmer();
          } else if (state is GettingProductInSuccess) {
            ProductModel productModel = state.product;
            String image = Uri.parse(
                        "http://146.190.207.16:3000/${state.product.media.media.toString()}")
                    .isAbsolute
                ? "http://146.190.207.16:3000/${state.product.media.media.toString()}"
                : "https://avatars.mds.yandex.net/i?id=6d2220ecdde320c636abeab21474d37c10c9a110-6335046-images-thumbs&n=13";
            return Column(children: [
              InkWell(
                onTap: (() {
                  Navigator.pushNamed(
                    context,
                    RouteName.productDetail,
                    arguments: int.parse(id),
                  );
                }),
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  height: 70.h,
                  width: 400.w,
                  child: Row(
                    children: [
                      Container(
                        height: 60.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.h),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 32.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productModel.brandName),
                          Container(
                            padding: const EdgeInsets.all(2),
                            margin: EdgeInsets.only(top: 4.h),
                            height: 20.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(8.r)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 0.2,
              ),
            ]);
          }

          return Container();
        },
      ),
    );
  }
}
