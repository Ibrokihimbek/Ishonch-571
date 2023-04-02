class Product {
  final int id;
  final String productName;
  final int productPrice;
  final String brandName;
  final String description;
  final bool isNew;
  final String status;
  final int currencyId;
  final int discount;

  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.brandName,
    required this.isNew,
    required this.status,
    required this.description,
    required this.currencyId,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        currencyId: json['currency_id'] as int? ?? 0,
        discount: json['discount'] as int? ?? 0,
        id: json['id'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        // Do not touch, product_price could be int and string
        productPrice: int.parse(json['product_price'].toString()) as int? ?? 0,
        brandName: json['brand_name'] as String? ?? "",
        description: json['description'] as String? ?? "",
        isNew: json['is_new'] as bool? ?? false,
        status: json['status'] as String? ?? "",
      );
}
