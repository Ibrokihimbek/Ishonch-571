import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/cubit/discount/discount_state.dart';
import 'package:ishonch/data/models/my_responce/my_responce.dart';
import 'package:ishonch/service/api_service/api_service.dart';
import 'package:ishonch/service/get_it/get_it.dart';

class DiscountCubit extends Cubit<DiscountState> {
  DiscountCubit() : super(DiscountInitial()) {
    getDiscount();
  }

  getDiscount() async {
    emit(GettingDiscountInProgress());
     MyResponse myResponse = await getIt<ApiService>().getAllDiscountProduct();
    if (myResponse.error.isEmpty) {
       emit(GettingDiscountInSuccess(discount: myResponse.data));
    } else {
      emit(GettingDiscountInFailury(status: myResponse.error));
    }
  }
}
