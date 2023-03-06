class Admin {
  final int id;
  final String name;
  final String password;

  Admin({
    required this.id,
    required this.name,
    required this.password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json['id'] as int? ?? 0,
        name: json['name'] as String? ?? "",
        password: json['password'] as String? ?? "",
      );
}
