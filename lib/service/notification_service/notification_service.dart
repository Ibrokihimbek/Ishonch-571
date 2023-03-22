import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../../bloc/notifications_bloc/notification_cacher_bloc/notification_cached_bloc.dart';
import '../../data/models/notification/notification_model.dart';
import '../get_it/get_it.dart';

class NotificationService{



  handleFirebaseNotificationMessages() async {
    //Foregrounddan kelgan messagelarni tutib olamiz
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationModel notificationModel = NotificationModel.fromJson(message.data);
        debugPrint("FOREGRAUNDGA TUSHDI");
        getIt<NotificationCachedBloc>().add(DoCachingNotificationEvent(notificationModel: notificationModel));
        //NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
        // LocalNotificationService.localNotificationService.showNotification(id: 1, title: notificationModel.title, subtitle: notificationModel.description);
      }
    });
  }

  setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();



    if (initialMessage != null) {
      getIt<NotificationCachedBloc>().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(initialMessage.data)));

    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("On app ishladi");
      getIt<NotificationCachedBloc>().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(message.data)));
   //   NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
    });
  }
}