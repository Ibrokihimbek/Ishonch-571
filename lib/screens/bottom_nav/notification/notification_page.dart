import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishonch/screens/bottom_nav/notification/widget/message_item.dart';
import 'package:ishonch/screens/bottom_nav/notification/widget/notification_item_widget.dart';
import '../../../bloc/notifications_bloc/notification_reader_bloc/notification_reader_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",style: TextStyle(fontSize: 24.sp)),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
            },
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Text("Mute Notification"),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    context.read<NotificationReaderBloc>().add(DeleteNotificationsEvent());

                  },
                  child: Row(
                    children: const [
                      Text("Clear All"),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocBuilder<NotificationReaderBloc,NotificationReaderState>(
        builder: (context, state) {
          if(state is ReadNotificationInProgress){
            return const Center(child:  CircularProgressIndicator());
          }
          else if(state is ReadNotificationInFailury){
            return Center(child: Text(state.status));
          }else if(state is ReadNotificationInSuccess){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {

                      return Padding(
                          padding: const  EdgeInsets.symmetric(horizontal: 24),
                          child: NotificationCourseItem(id: state.notifications[index].id,)
                          //Center(child: Text("${state.notifications[index].id}")));


                          );

                  }),
            );
          }else{
            context.read<NotificationReaderBloc>().add(ReadNotificationEvent());
            return Container();
          }

        },
      ),
    );
  }
}