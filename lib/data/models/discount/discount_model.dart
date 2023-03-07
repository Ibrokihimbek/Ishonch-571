class Discount {
  final int id;
  final int discount;
  final String productName;
  final int productPrice;
  final bool isDelivery;
  final bool isNew;

  Discount({
    required this.id,
    required this.discount,
    required this.productName,
    required this.productPrice,
    required this.isDelivery,
    required this.isNew,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        id: json['id'] as int? ?? 0,
        discount: json['discount'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        productPrice: json['product_price'] as int? ?? 0,
        isDelivery: json['is_delivery'] as bool? ?? false,
        isNew: json['is_new'] as bool? ?? false,
      );
}
