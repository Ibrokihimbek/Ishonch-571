import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_category/category_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
 final CategoriesRepo categoriesRepo;

 CategoriesBloc(this.categoriesRepo):super(InitialCategoriesState()) {
  on<FetchAllCategories>(_fetchAllCategories);
 }

 _fetchAllCategories(FetchAllCategories event, Emitter<CategoriesState> emit) async {
  emit(LoadCategoriesInProgress());

  MyResponse myResponse = await categoriesRepo.getAllCategories();
  if(myResponse.error.isEmpty){
    emit(LoadCategoriesInSuccess(categories: myResponse.data));
  } else {
    emit(LoadCategoriesInFairlure(errorText: myResponse.error));
  }
 }
}