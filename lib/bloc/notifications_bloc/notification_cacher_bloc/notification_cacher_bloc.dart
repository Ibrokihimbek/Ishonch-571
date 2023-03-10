import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/notification/notification_model.dart';
import '../../../data/repositories/notification_repository.dart';
import '../../../service/get_it/get_it.dart';
import '../notification_reader_bloc/notification_reader_bloc.dart';
part 'notification_cacher_event.dart';
part 'notification_cacher_state.dart';

class NotificationCacherBloc extends Bloc<DoCachingNotificationEvent, NotificationCacherState> {
  NotificationCacherBloc() : super(NotificationCacherState(notificationStatus: NotificationStatus.PURE,status: "")) {
    on<DoCachingNotificationEvent>(cacheNotification);
  }


  cacheNotification(DoCachingNotificationEvent event, emit) {
    emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHING_IN_PROGRESS));
    try{
      getIt<NotificationsRepository>().addNotification(event.notificationModel);
      emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHED_IN_SUCCESS));
      getIt<NotificationReaderBloc>().add(ReadNotificationEvent());
    }catch(e){
      emit(NotificationCacherState(notificationStatus: NotificationStatus.CACHED_IN_FAILURY,status: e.toString()));
    }

  }
}