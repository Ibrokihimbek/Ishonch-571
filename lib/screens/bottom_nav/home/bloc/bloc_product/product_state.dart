
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';

abstract class ProductsState {}

class InitialProductsState extends ProductsState {}

class LoadProductsInProgress extends ProductsState {}

class LoadProductsInSuccess extends ProductsState {
  final List<ProductModel> products;
 
  LoadProductsInSuccess({required this.products});
}

class LoadProductsInFairlure extends ProductsState {
  final String errorText;
 
  LoadProductsInFairlure({required this.errorText});
}
