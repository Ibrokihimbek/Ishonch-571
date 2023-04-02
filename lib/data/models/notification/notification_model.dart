import 'package:flutter/cupertino.dart';

class NotificationModel {

  final String id;


  NotificationModel(
      {
        required this.id,
      });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {

    return NotificationModel(
        id: json["id"] ?? "",);
  }

  toJson() {
    debugPrint("MANAAAAAAAA");

    return {
      "id": id.toString(),

    };
  }
}
