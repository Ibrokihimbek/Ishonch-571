part of 'category_bloc.dart';

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
