import 'package:ishonch/data/models/model_category/categories/category_model.dart';

abstract class CategoriesState {}

class InitialCategoriesState extends CategoriesState {}

class LoadCategoriesInProgress extends CategoriesState {}

class LoadCategoriesInSuccess extends CategoriesState {
  final List<CategoryModel> categories;
 
  LoadCategoriesInSuccess({required this.categories});
}

class LoadCategoriesInFailure extends CategoriesState {
  final String errorText;
 
  LoadCategoriesInFailure({required this.errorText});
}
