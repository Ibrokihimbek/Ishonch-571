part of 'notification_reader_bloc.dart';

@immutable
abstract class NotificationReaderState {}

class NotificationReaderInitial extends NotificationReaderState {}
class ReadNotificationInSuccess extends NotificationReaderState {
  List<NotificationModel> notifications;

  ReadNotificationInSuccess({required this.notifications});
}
class ReadNotificationInFailury extends NotificationReaderState {
  String status;

  ReadNotificationInFailury({required this.status});

}
class ReadNotificationInProgress extends NotificationReaderState {}