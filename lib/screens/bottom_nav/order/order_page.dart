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
    return BlocProvider(create: (context) => OrdersBloc(CategoriesRepo(apiService: ApiService()))..add(FetchAllOrders()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar:AppBar(
          title: const Text('Orders Page'),
        ),
        body: BlocBuilder<OrdersBloc, OrdersState>(
          builder: (context, state) {
            if (state is InitialOrdersState) {
              return const Center(
                child: Text('hali data yoq'),
              );
            } else if (state is LoadOrdersInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadOrdersInSuccess) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(state.orders[i].id.toString()),
                  );
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
