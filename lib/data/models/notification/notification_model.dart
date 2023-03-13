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
    print("MANAAAAAAAA");

    return {
      "id": id.toString(),

    };
  }
}
