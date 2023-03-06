class CreateOrderDto {
  final int productId;
  final int discountId;
  final int userId;
  final String clientName;
  final String clientAddress;
  final String clientPhone;

  CreateOrderDto({
    required this.productId,
    required this.discountId,
    required this.userId,
    required this.clientName,
    required this.clientAddress,
    required this.clientPhone,
  });

  factory CreateOrderDto.fromJson(Map<String, dynamic> json) => CreateOrderDto(
        productId: json['product_id'] as int? ?? 0,
        discountId: json['discount_id'] as int? ?? 0,
        userId: json['user_id'] as int? ?? 0,
        clientName: json['client_name'] as String? ?? "",
        clientAddress: json['client_address'] as String? ?? "",
        clientPhone: json['client_phone'] as String? ?? "",
      );
}
