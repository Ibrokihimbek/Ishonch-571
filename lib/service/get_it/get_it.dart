import 'package:get_it/get_it.dart';
import 'package:ishonch/data/repositories/notification_repository.dart';
import 'package:ishonch/data/repositories/product_repo.dart';
import 'package:ishonch/service/api_service/api_client.dart';
import 'package:ishonch/service/api_service/api_service.dart';

import '../../bloc/notifications_bloc/notification_cacher_bloc/notification_cacher_bloc.dart';
import '../../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';
import '../notification_service/notification_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => ApiClient());
  getIt.registerLazySingleton(() => ProductRepo());
  getIt.registerLazySingleton(() => NotificationsRepository());
  getIt.registerLazySingleton(() => NotificationService());
  getIt.registerLazySingleton(() => NotificationCacherBloc());
  getIt.registerLazySingleton(() => NotificationReaderBloc());


}
