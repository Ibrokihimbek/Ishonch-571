import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/order/order_model.dart';

class OrderItem extends StatelessWidget {
   OrderItem({Key? key,required this.order }) : super(key: key);
  OrderModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: 15, right: 30, left: 30, top: 30)
          .r,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset:
            const Offset(0, 5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(top: 8,left: 12,right: 8,bottom: 8).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.product.productName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(height: 5.h),
                Text(
                  order.product.brandName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                Text(
                  "state: ${order.product.isNew == true ? "new" : "old"}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
                SizedBox(height: 1.h),
                Text(
                  order.clientPhone,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 28.0.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$ ${order.product.productPrice.toString()}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat.yMd()
                        .format(
                        DateTime.parse(order.createdAt))
                        .toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
