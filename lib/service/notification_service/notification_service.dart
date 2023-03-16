import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ishonch/screens/app_router.dart';
import '../../bloc/notifications_bloc/notification_cacher_bloc/notification_cacher_bloc.dart';
import '../../data/models/notification/notification_model.dart';
import '../../data/repositories/notification_repository.dart';
import '../get_it/get_it.dart';
import '../navigation_service/navigation_service.dart';

class NotificationService{



  handleFirebaseNotificationMessages() async {
    //Foregrounddan kelgan messagelarni tutib olamiz
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationModel notificationModel = NotificationModel.fromJson(message.data);
        print("FOREGRAUNDGA TUSHDI");
        getIt<NotificationCacherBloc>().add(DoCachingNotificationEvent(notificationModel: notificationModel));
        //NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
        // LocalNotificationService.localNotificationService.showNotification(id: 1, title: notificationModel.title, subtitle: notificationModel.description);
      }
    });
  }

  setupInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();



    if (initialMessage != null) {
      getIt<NotificationCacherBloc>().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(initialMessage.data)));

    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("On app ishladi");
      getIt<NotificationCacherBloc>().add(DoCachingNotificationEvent(notificationModel: NotificationModel.fromJson(message.data)));
   //   NavigationService.instance.navigateToErrorScreen(routeName: RouteName.bottomNavigation);
    });
  }
}