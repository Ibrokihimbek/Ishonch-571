import '../product/product_model.dart';

class OrderModel {
  final int id;
  final String clientName;
  final String clientAddress;
  final String clientPhone;
  final String createdAt;
  final String updatedAt;
  Product product;

  OrderModel({
    required this.id,
    required this.clientName,
    required this.clientAddress,
    required this.clientPhone,
    required this.createdAt,
    required this.updatedAt,
    required this.product
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as int? ?? 0,
        clientName: json['client_name'] as String? ?? "",
        clientAddress: json['client_address'] as String? ?? "",
        clientPhone: json['client_phone'] as String? ?? "",
        createdAt: json['createdAt'] as String? ?? "",
        updatedAt: json['updatedAt'] as String? ?? "",
        product:json['product'] !=null?  Product.fromJson(json['product'] as Map<String, dynamic>? ?? {}): Product.fromJson(json['discount'] as Map<String, dynamic>? ?? {}),
      );
}
