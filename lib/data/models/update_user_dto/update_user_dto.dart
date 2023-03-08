class UpdateUserDto {
  final String userName;
  final String userEmail;
  final String userPhone;
  final String hashedPassword;
  final String userImage;
  final String hashedRefreshToken;

  UpdateUserDto({
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.hashedPassword,
    required this.userImage,
    required this.hashedRefreshToken,
  });

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) => UpdateUserDto(
        userName: json['user_name'] as String? ?? "",
        userEmail: json['user_email'] as String? ?? "",
        userPhone: json['user_phone'] as String? ?? "",
        hashedPassword: json['hashed_password'] as String? ?? "",
        userImage: json['user_image'] as String? ?? "",
        hashedRefreshToken: json['hashed_refresh_token'] as String? ?? "",
      );
}
