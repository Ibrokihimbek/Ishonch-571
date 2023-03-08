import 'package:dio/dio.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/service/api_service/api_client.dart';
import '../../data/models/order/order_model.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCategories() async {
    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get('${dio.options.baseUrl}/category');
      if (response.statusCode == 200) {
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
      if (response.statusCode == 200) {
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
    Dio dio = Dio();
    try {
      Response response = await dio.get('${dio.options.baseUrl}/order',
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlzX2FjdGl2ZSI6dHJ1ZSwiaXNfYWRtaW4iOnRydWUsImlzX2NyZWF0b3IiOmZhbHNlLCJpYXQiOjE2NzgyODAwNjcsImV4cCI6MTY3ODI4Mjc2N30.GAZp87aVO4e6i_TMO4Mwftim07vxZBqPk66VdqvRE7A"
          }));
      if (response.statusCode == 200) {
        myResponse.data = response.data.map((e) => Order.fromJson(e)).toList();
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

  MyResponse({required this.error, this.data});
}
