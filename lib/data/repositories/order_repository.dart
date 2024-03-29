import 'package:ishonch/data/models/create_order_dto/create_order_dto.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/service/get_it/get_it.dart';

import '../models/my_responce/my_responce.dart';

class OrderRepository {
  Future<MyResponse> createOrder(CreateOrderDto createOrderDto,bool isDiscount) async {
    MyResponse myResponse = MyResponse(error: '');
     myResponse = await getIt<ApiService>().createOrder(createOrderDto,isDiscount);
    return myResponse;
  }

  Future<MyResponse> getAllOrders()=> getIt.get<ApiService>().getAllOrders();
}
