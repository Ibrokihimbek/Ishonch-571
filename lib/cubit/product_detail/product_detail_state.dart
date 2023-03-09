import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';

abstract class ProductStateById {}

class ProductInitial extends ProductStateById{}

class GettingProductInProgress extends ProductStateById{}
class GettingProductInSuccess extends ProductStateById{
  ProductModel product;
  GettingProductInSuccess({required this.product});
}
class GettingProductInFailury extends ProductStateById{
  String status;
  GettingProductInFailury({required this.status});
}