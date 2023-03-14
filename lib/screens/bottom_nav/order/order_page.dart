import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_event.dart';
import 'package:ishonch/bloc/orders_bloc/orders_state.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/screens/bottom_nav/order/widget/order_item.dart';
import 'package:ishonch/screens/bottom_nav/order/widget/order_shimmer.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(CategoriesRepo())..add(FetchAllOrders()),
      child: Scaffold(
        backgroundColor: const Color(0XFFFCFCFC),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8).r,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10).r,
                width: 10.w,
                height: 10.h,
                decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(100)),
                child: SvgPicture.asset(
                  AppImages.iconBackArrow,
                  width: 10.w,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.black),
        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state is LoadOrdersInProgress) {
              return const Center(
                child: OrderShimmer(),
              );
            } else if (state is LoadOrdersInFairlure) {
              return Center(child: Text(state.errorText));
            } else if (state is LoadOrdersInSuccess) {
              return state.orders.isEmpty
                  ? Center(
                      child: Lottie.asset(AppImages.lottieEmpty),
                    )
                  : ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        return OrderItem(order: state.orders[index]);
                      },
                    );
            } else if (state is LoadOrdersInFairlure) {
              return Center(child: Text(state.errorText));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
