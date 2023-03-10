import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:ishonch/service/api_service/custom_exceptions.dart';
const String baseUrl= "http://146.190.207.16:3000/api/v2";

class ApiClient{

  ApiClient(){
    _init();
  }

   late Dio dio;

  _init(){
    dio = Dio(
      BaseOptions(
        connectTimeout: 25000,
        receiveTimeout: 20000,
        baseUrl: baseUrl,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error, ErrorInterceptorHandler handler){
        print("ON ERRORGA KIRDI:${error.toString()}");
        switch (error.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          throw DeadlineExceededException(error.requestOptions);
          case DioErrorType.receiveTimeout:
          throw ReceiveTimeOutException(error.requestOptions);
          case DioErrorType.response:
            switch (error.response?.statusCode) {
              case 400:
                throw BadRequestException(error.response?.data['message']);
              case 401:
                throw UnauthorizedException(error.requestOptions);
              case 404:
                throw NotFoundException(error.requestOptions);
              case 409:
                throw ConflictException(error.requestOptions);
              case 500:
              case 501:
              case 503:
                throw InternalServerErrorException(error.requestOptions);
            }
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            throw OtherError(error.requestOptions);
        }
        debugPrint('Error Status Code:${error.response?.statusCode}');
      return handler.next(error);
      },
      onRequest: (RequestOptions requestOptions,RequestInterceptorHandler handler){
        print("SO'ROV YUBORILDI");
        String currentLocale = "uz";
        // requestOptions.headers["Authorization"];
        // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjQsImlzX2FjdGl2ZSI6dHJ1ZSwiaXNfYWRtaW4iOnRydWUsImlzX2NyZWF0b3IiOmZhbHNlLCJpYXQiOjE2NzgyODAwNjcsImV4cCI6MTY3ODI4Mjc2N30.GAZp87aVO4e6i_TMO4Mwftim07vxZBqPk66VdqvRE7A";
        requestOptions.headers["Accept"] = "application/json";
        requestOptions.headers["Accept-Language"] =
        currentLocale.isEmpty ? "ru" : currentLocale;
      return  handler.next(requestOptions);
      },
      onResponse: (Response response,ResponseInterceptorHandler handler ){
        print("URAAA RESPONSE KELDI");
      return handler.next(response);
      }
    ));
  }

}