class Product {
  final int id;
  final String productName;
  final double productPrice;
  final String brandName;
  final bool isNew;
  final String status;

  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.brandName,
    required this.isNew,
    required this.status,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        productPrice: json['product_price'] as double? ?? 0.0,
        brandName: json['brand_name'] as String? ?? "",
        isNew: json['is_new'] as bool? ?? false,
        status: json['status'] as String? ?? "",
      );
}
