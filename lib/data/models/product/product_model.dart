class Product {
  final int id;
  final String productName;
  final int productPrice;
  final String brandName;
  final String description;
  final bool isNew;
  final String status;

  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.brandName,
    required this.isNew,
    required this.status,
    required this.description
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        productPrice: json['product_price'] as int? ?? 0,
        brandName: json['brand_name'] as String? ?? "",
    description: json['description'] as String? ?? "",
        isNew: json['is_new'] as bool? ?? false,
        status: json['status'] as String? ?? "",
      );
}
