import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/data/repositories/category_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final CategoriesRepo productsRepo;

  ProductsBloc(this.productsRepo) : super(InitialProductsState()) {
    on<FetchAllProducts>(_fetchAllProducts);
  }

  _fetchAllProducts(FetchAllProducts event, Emitter<ProductsState> emit) async {
    emit(LoadProductsInProgress());

    MyResponse myResponse = await productsRepo.getAllProduct();
    if (myResponse.error.isEmpty) {
      emit(LoadProductsInSuccess(products: myResponse.data));
    } else {
      emit(LoadProductsInFailure(errorText: myResponse.error));
    }
  }
}
