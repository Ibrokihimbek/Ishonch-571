class User {
  final int id;
  final String userName;
  final String userEmail;
  final bool isAdmin;
  final bool isCreator;
  final String userPhone;
  final String hashedPassword;
  final String userImage;
  final String hashedRefreshToken;

  User({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.isAdmin,
    required this.isCreator,
    required this.userPhone,
    required this.hashedPassword,
    required this.userImage,
    required this.hashedRefreshToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int? ?? 0,
        userName: json['user_name'] as String? ?? "",
        userEmail: json['user_email'] as String? ?? "",
        isAdmin: json['is_admin'] as bool? ?? false,
        isCreator: json['is_creator'] as bool? ?? false,
        userPhone: json['user_phone'] as String? ?? "",
        hashedPassword: json['hashed_password'] as String? ?? "",
        userImage: json['user_image'] as String? ?? "",
        hashedRefreshToken: json['hashed_refresh_token'] as String? ?? "",
      );
}
