import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/bloc/orders_bloc/orders_event.dart';
import 'package:ishonch/bloc/orders_bloc/orders_state.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/data/models/order/order_model.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/data/repositories/order_repository.dart';
import 'package:ishonch/service/get_it/get_it.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final CategoriesRepo categoriesRepo;

  OrdersBloc(this.categoriesRepo) : super(InitialOrdersState()) {
    on<FetchAllOrders>(_fetchAllOrders);
  }

  _fetchAllOrders(FetchAllOrders event, Emitter<OrdersState> emit) async {
    emit(LoadOrdersInProgress());

    MyResponse myResponse = await getIt.get<OrderRepository>().getAllOrders();
    if (myResponse.error.isEmpty) {
      emit(LoadOrdersInSuccess(orders: myResponse.data));
    } else {
      emit(LoadOrdersInFairlure(errorText: myResponse.error));
    }
  }
}
