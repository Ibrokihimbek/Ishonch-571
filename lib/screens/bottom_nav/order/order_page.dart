import 'package:easy_localization/easy_localization.dart';
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
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.black),
          title: Text(
            "Buyurtmalar_bolimi".tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
