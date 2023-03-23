import 'package:get_it/get_it.dart';
import 'package:ishonch/data/repositories/notification_repository.dart';
import 'package:ishonch/data/repositories/discount_repo.dart';
import 'package:ishonch/data/repositories/order_repository.dart';

import 'package:ishonch/service/api_service/api_client.dart';
import 'package:ishonch/service/api_service/api_service.dart';

import '../../bloc/notifications_bloc/notification_cacher_bloc/notification_cached_bloc.dart';
import '../../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';
import '../notification_service/notification_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => NotificationsRepository());
  getIt.registerLazySingleton(() => NotificationService());
  getIt.registerLazySingleton(() => NotificationCachedBloc());
  getIt.registerLazySingleton(() => NotificationReaderBloc());


  getIt.registerLazySingleton(() => OrderRepository());
  getIt.registerLazySingleton(() => DiscountProductRepo());
}
