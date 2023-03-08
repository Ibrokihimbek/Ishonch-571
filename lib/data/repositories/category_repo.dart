import 'package:ishonch/service/api_service/api_service.dart';

class CategoriesRepo {
  CategoriesRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCategories() =>
      apiService.getAllCategories();

  Future<MyResponse> getAllProduct() =>
      apiService.getAllProduct();

  Future<MyResponse> getAllOrders()=>apiService.getAllOrders();
}