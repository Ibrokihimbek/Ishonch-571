import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/service/get_it/get_it.dart';

class ProductRepo {
  Future<MyResponse> getCourseById({required int id}) async {
    MyResponse myResponse = MyResponse(error: '');
    // myResponse = await getIt<ApiService>().getProductById(id: id);
    return myResponse;
  }
}
