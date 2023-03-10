import 'dart:async';
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../../data/models/notification/notification_model.dart';
import '../../../data/repositories/notification_repository.dart';
import '../../../service/get_it/get_it.dart';
part 'notification_reader_event.dart';
part 'notification_reader_state.dart';

class NotificationReaderBloc extends Bloc<ReadNotificationEvent, NotificationReaderState> {
  NotificationReaderBloc() : super(NotificationReaderInitial()) {
    on<ReadNotificationEvent>(readNotifications);
    on<DeleteNotificationsEvent>(deleteNotifications);
  }

  readNotifications(event, emit) async {
    emit(ReadNotificationInProgress());
    try{
      var  notificationsList = await getIt<NotificationsRepository>().getNotifications();
      List<NotificationModel> notifications = notificationsList.map((e) => NotificationModel.fromJson(e)).toList();
      emit(ReadNotificationInSuccess(notifications: notifications));
    }catch(e){
      emit(ReadNotificationInFailury(status: e.toString()));
    }
  }


  deleteNotifications(event, emit) async {
    print("DELETED");
    getIt<NotificationsRepository>().deleteNotifications();
    add(ReadNotificationEvent());
  }
}