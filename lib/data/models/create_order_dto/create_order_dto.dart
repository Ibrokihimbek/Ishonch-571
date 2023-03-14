class CreateOrderDto {
  final int productId;
  final String clientName;
  final String clientAddress;
  final String clientPhone;
  final String deviceId;

  CreateOrderDto({
    required this.productId,
    required this.clientName,
    required this.clientAddress,
    required this.clientPhone,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "product_id": productId,
      "client_name": clientName,
      "client_address": clientAddress,
      "client_phone": clientPhone,
      "device_id": deviceId
    };
  }
}
