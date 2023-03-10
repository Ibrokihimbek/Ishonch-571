import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/cubit/product_detail/product_detail_state.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/service/get_it/get_it.dart';

class ProductCubitById extends Cubit<ProductStateById> {
  ProductCubitById(String id) : super(ProductInitial()) {
    getProductById(id);
  }

  getProductById(String id) async {
    emit(GettingProductInProgress());
     MyResponse myResponse = await getIt<ApiService>().getProductById(id: id);
    if (myResponse.error.isEmpty) {
       emit(GettingProductInSuccess(product: myResponse.data));
    } else {
      emit(GettingProductInFailury(status: myResponse.error));
    }
  }
}
