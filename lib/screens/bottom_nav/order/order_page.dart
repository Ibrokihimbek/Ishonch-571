import 'package:flutter/material.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_event.dart';
import 'package:ishonch/bloc/orders_bloc/orders_state.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/app_image.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(CategoriesRepo())
        ..add(FetchAllOrders()),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Orders Page',style: Theme.of(context).textTheme.headlineMedium,),
        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state is LoadOrdersInProgress) {
              print("Progresda AAAAAAAAAAAAAAAAAA");
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadOrdersInSuccess) {
              print("Progresda SSSSSSSSSSSSSSSSSSSS");
              return  state.orders.isEmpty
                  ? Lottie.asset(AppImages.noNotification): ListView.builder(
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
            } else if (state is LoadOrdersInFairlure) {
              print("Progresda LLLLLLLLLLLLLLLLLLL");
              return Center(child: Text(state.errorText));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
