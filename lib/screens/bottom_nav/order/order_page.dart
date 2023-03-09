import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_event.dart';
import 'package:ishonch/bloc/orders_bloc/orders_state.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/utils/app_colors.dart';
import 'package:ishonch/utils/app_image.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(CategoriesRepo(apiService: ApiService()))
        ..add(FetchAllOrders()),
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
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadOrdersInFairlure) {
              return Center(child: Text(state.errorText));
            } else if (state is LoadOrdersInSuccess) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  var order = state.orders[index];
                  return Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Name : ${order.clientName}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Client number: ${order.clientPhone}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "CreatedAt: ${order.createdAt}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: Stack(
            children: [
              Positioned(
                  top: 113.h,
                  child: Column(
                    children: const [
                       Text(
                        "My Orders",
                         style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
