import 'package:flutter/material.dart';
import 'package:ishonch/bloc/orders_bloc/orders_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_event.dart';
import 'package:ishonch/bloc/orders_bloc/orders_state.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(CategoriesRepo(apiService: ApiService()))
        ..add(FetchAllOrders()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          title: const Text('Orders Page'),
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
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            state.orders[index].clientPhone,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 18, top: 15),
                          child: Text(
                            state.orders[index].clientPhone,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
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
