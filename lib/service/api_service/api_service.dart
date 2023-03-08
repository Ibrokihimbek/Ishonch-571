import 'package:dio/dio.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/service/api_service/api_client.dart';

class ApiService extends ApiClient {
  
  Future<MyResponse> getAllCategories() async {

    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/category');
      if(response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

     return myResponse;
  }

   Future<MyResponse> getAllProduct() async {

    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/product');
      if(response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

     return myResponse;
  }

  Future<MyResponse> getAllOrders() async {

    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/order');
      if(response.statusCode == 200) {
        myResponse.data = (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }



}




class MyResponse {
  dynamic data;
  String error = '';

  MyResponse({
       required this.error, 
       this.data});
}