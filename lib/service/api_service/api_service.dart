import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ishonch/data/geocoding/geocoding.dart';
import 'package:ishonch/data/models/model_category/categories/category_model.dart';
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/service/api_service/api_client.dart';
import 'package:ishonch/utils/constans.dart';
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
    try {
      Response response = await dio.get('${dio.options.baseUrl}/order');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = (response.data as List?)
                ?.map((e) => OrderModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }

  Future<String> getLocationName(
      {required String geoCodeText, required String kind}) async {
    Dio dio = Dio();
    String text = '';
    try {
      late Response response;
      Map<String, String> queryParams = {
        'apikey': mapApiKey,
        'geocode': geoCodeText,
        'lang': 'uz_UZ',
        'format': 'json',
        'kind': kind,
        'rspn': '1',
        'results': '1',
      };
      print("QueryParams>>>>>>>>>>$queryParams");
      response = await dio.get(
        "https://geocode-maps.yandex.ru/1.x/",
        queryParameters: queryParams,
      );

      if (response.statusCode! == HttpStatus.ok) {
        Geocoding geocoding = Geocoding.fromJson(response.data);
        if (geocoding.response.geoObjectCollection.featureMember.isNotEmpty) {
          text = geocoding.response.geoObjectCollection.featureMember[0]
              .geoObject.metaDataProperty.geocoderMetaData.text;
          print("text>>>>>>>>>>>> $text");
        } else {
          text = 'Aniqlanmagan hudud';
        }
        return text;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

//!------------------ Get Product By ID -----------------------------------

  Future<MyResponse> getProductById({required int id}) async {
    MyResponse myResponse = MyResponse(error: '');
    try {
      Response response = await dio.get("${dio.options.baseUrl}/product/$id");
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = ProductModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
