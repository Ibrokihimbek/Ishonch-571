part of 'order_create_cubit.dart';

@immutable
abstract class OrderCreateState {}

class OrderCreateInitial extends OrderCreateState {}
class OrderCreateLoading extends OrderCreateState {}
class OrderCreateSuccess extends OrderCreateState {}
class OrderCreateError extends OrderCreateState {
  final String errorText;
  OrderCreateError({required this.errorText});
}
