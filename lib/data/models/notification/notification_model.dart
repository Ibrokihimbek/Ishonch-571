class NotificationModel {
  int courseId;
  final String title;
  final String description;
  final String image;
  final DateTime date;
  final bool isNewCourse;

  NotificationModel(
      {required this.title,
        required this.description,
        required this.image,
        required this.date,
        this.isNewCourse = false,
        required this.courseId});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    print("MANA YANAAA ${json["courseId"]}");
    return NotificationModel(
        date: DateTime.parse(json["dateTime"].isNotEmpty
            ? json["dateTime"]
            : DateTime.now().toString()),
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        image: json["image"] ?? "",
        courseId: json["courseId"] is String?int.parse(json["courseId"] ?? "999"):json["courseId"]??999,
        isNewCourse: json["courseId"] == 999? false : true);
  }

  toJson() {
    print("MANAAAAAAAA");
    print(courseId);
    return {
      "dateTime": date.toString(),
      "title": title,
      "description": description,
      "image": image,
      "courseId": courseId,
    };
  }
}
