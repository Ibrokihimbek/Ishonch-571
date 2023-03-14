import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/service/get_it/get_it.dart';

class CategoriesRepo {
  CategoriesRepo();

  Future<MyResponse> getAllCategories() =>
      getIt.get<ApiService>().getAllCategories();

  Future<MyResponse> getAllProduct() =>
      getIt.get<ApiService>().getAllProduct();
}