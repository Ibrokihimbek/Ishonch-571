class Otp {
  final String id;
  final int otp;
  final String expirationTime;
  final bool isVerified;

  Otp({
    required this.id,
    required this.otp,
    required this.expirationTime,
    required this.isVerified,
  });

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        id: json['id'] as String? ?? "",
        otp: json['otp'] as int? ?? 0,
        expirationTime: json['expiration_time'] as String? ?? "",
        isVerified: json['is_verified'] as bool? ?? false,
      );
}
