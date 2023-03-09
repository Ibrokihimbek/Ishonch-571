import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/repositories/category_repo.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/producat_event.dart';
import 'package:ishonch/screens/bottom_nav/home/bloc/bloc_product/product_state.dart';
import 'package:ishonch/service/api_service/api_service.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
 final CategoriesRepo productsRepo;

 ProductsBloc(this.productsRepo):super(InitialProductsState()) {
  on<FetchAllProducts>(_fetchAllProducts);
 }

 _fetchAllProducts(FetchAllProducts event, Emitter<ProductsState> emit) async {
  emit(LoadProductsInProgress());
  
  MyResponse myResponse = await productsRepo.getAllProduct();
  if(myResponse.error.isEmpty){
    emit(LoadProductsInSuccess(products: myResponse.data));
  } else {
    emit(LoadProductsInFairlure(errorText: myResponse.error));
  }
 }
}