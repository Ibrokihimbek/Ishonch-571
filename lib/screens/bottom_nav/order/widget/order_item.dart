import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/data/models/order/order_model.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 12, right: 8, bottom: 8).r,
      margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16).r,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).hintColor),
        borderRadius: BorderRadius.circular(13.r),
        color: Theme.of(context).primaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  order.product.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 18.sp),
                ),
              ),
              const SizedBox()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.product.brandName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16.sp),
              ),
              Text(
                "${order.product.productPrice} ${order.product.currencyId == 1 ? 'UZS' : 'USD'}",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Holati".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16.sp),
              ),
              Text(
                order.product.isNew == true ? "New".tr() : "Old".tr(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16.sp),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.clientPhone,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 16.sp),
              ),
              Text(
                DateFormat.yMd()
                    .format(
                      DateTime.parse(order.createdAt),
                    )
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontSize: 16.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
