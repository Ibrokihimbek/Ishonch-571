import 'package:bloc/bloc.dart';
import 'package:ishonch/data/models/create_order_dto/create_order_dto.dart';
import 'package:ishonch/data/repositories/order_repository.dart';
import 'package:ishonch/service/get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../data/models/my_responce/my_responce.dart';

part 'order_create_state.dart';

class OrderCreateCubit extends Cubit<OrderCreateState> {
  OrderCreateCubit() : super(OrderCreateInitial());

  createOrder(CreateOrderDto createOrderDto) async {
    emit(OrderCreateLoading());
    MyResponse myResponse =
        await getIt.get<OrderRepository>().createOrder(createOrderDto);
    await Future.delayed( const Duration(seconds: 2));
    if (myResponse.error.isEmpty) {
      emit(OrderCreateSuccess());
    } else {
      OrderCreateError(errorText: myResponse.error);
    }
  }
}
