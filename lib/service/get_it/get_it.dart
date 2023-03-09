import 'package:get_it/get_it.dart';
import 'package:ishonch/data/repositories/notification_repository.dart';
import 'package:ishonch/data/repositories/product_repo.dart';
import 'package:ishonch/service/api_service/api_client.dart';
import 'package:ishonch/service/api_service/api_service.dart';

import '../notification_service/notification_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => ProductRepo());
  getIt.registerLazySingleton(() => NotificationsRepository());
  getIt.registerLazySingleton(() => NotificationService());
}
