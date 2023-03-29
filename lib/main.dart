import 'package:device_info_plus/device_info_plus.dart';
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
import 'dart:io' show Platform;

import 'data/models/notification/notification_model.dart';
import 'data/repositories/notification_repository.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  getIt<NotificationsRepository>()
      .addNotification(NotificationModel.fromJson(message.data));
  debugPrint("Message keldi bratan");
  debugPrint("Handling a background message: ${message.data}");
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
  FirebaseMessaging.instance.subscribeToTopic("ishonch_news");
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);


  if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    debugPrint('DEVICE ID ${androidInfo.id}');
    debugPrint('DEVICE MODEL ${androidInfo.model}');
    debugPrint('DEVICE SERIAL  NUMBER ${androidInfo.serialNumber}');
  } else if (Platform.isIOS) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    String deviceID = iosDeviceInfo.identifierForVendor.toString();
  }

  StorageRepository.getInstance();
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
