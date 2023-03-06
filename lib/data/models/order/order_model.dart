class Order {
  final int id;
  final String clientName;
  final String clientAddress;
  final String clientPhone;

  Order({
    required this.id,
    required this.clientName,
    required this.clientAddress,
    required this.clientPhone,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] as int? ?? 0,
        clientName: json['client_name'] as String? ?? "",
        clientAddress: json['client_address'] as String? ?? "",
        clientPhone: json['client_phone'] as String? ?? "",
      );
}
