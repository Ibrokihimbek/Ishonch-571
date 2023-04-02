import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/bottom_nav/notification/widget/notification_appbar.dart';
import 'package:ishonch/screens/bottom_nav/notification/widget/notification_item_widget.dart';
import 'package:ishonch/utils/app_image.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(
        onMute: () {
          context
              .read<NotificationReaderBloc>()
              .add(DeleteNotificationsEvent());
        },
      ),
      body: BlocBuilder<NotificationReaderBloc, NotificationReaderState>(
        builder: (context, state) {
          if (state is ReadNotificationInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ReadNotificationInFailury) {
            return Center(
              child: Text(
                state.status,
                style: const TextStyle(color: Colors.black),
              ),
            );
          } else if (state is ReadNotificationInSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: state.notifications.isEmpty
                  ? Lottie.asset(AppImages.noNotification)
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.notifications.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w).w,
                          child: NotificationProductItem(
                            id: state.notifications[index].id,
                          ),
                        );
                      },
                    ),
            );
          } else {
            context.read<NotificationReaderBloc>().add(ReadNotificationEvent());
            return Lottie.asset(AppImages.noNotification);
          }
        },
      ),
    );
  }
}
