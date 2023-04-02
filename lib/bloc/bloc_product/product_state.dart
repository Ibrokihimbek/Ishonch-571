part of 'product_bloc.dart';
abstract class ProductsState {}

class InitialProductsState extends ProductsState {}

class LoadProductsInProgress extends ProductsState {}

class LoadProductsInSuccess extends ProductsState {
  final List<ProductModel> products;

  LoadProductsInSuccess({required this.products});
}

class LoadProductsInFailure extends ProductsState {
  final String errorText;

  LoadProductsInFailure({required this.errorText});
}
