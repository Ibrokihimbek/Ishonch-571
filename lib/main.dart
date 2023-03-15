import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishonch/app/app.dart';
import 'package:ishonch/app/app_bloc_observer.dart';
import 'package:ishonch/data/storage_repository/storage_repository.dart';
import 'package:ishonch/service/get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:ishonch/service/notification_service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'data/models/notification/notification_model.dart';
import 'data/repositories/notification_repository.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  getIt<NotificationsRepository>().addNotification(NotificationModel.fromJson(message.data));
  print("Message keldi bratan");
  print("Handling a background message: ${message.data}");
}


void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("ishonch_news");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  StorageRepository.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
