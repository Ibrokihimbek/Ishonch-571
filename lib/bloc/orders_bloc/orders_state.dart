import 'package:ishonch/data/models/order/order_model.dart';

abstract class OrdersState {}

class InitialOrdersState extends OrdersState {}

class LoadOrdersInProgress extends OrdersState {}

class LoadOrdersInSuccess extends OrdersState {
  final List<Order> orders;
 
  LoadOrdersInSuccess({required this.orders});
}

class LoadOrdersInFairlure extends OrdersState {
  final String errorText;

  LoadOrdersInFairlure({required this.errorText});
}
