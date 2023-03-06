class CreateProductDto {
  final String productName;
  final double productPrice;
  final int appliancesCharacterics;
  final int notebookCharacterics;
  final int phoneCharacterics;
  final int currencyId;
  final int productYearPrice;
  final String description;
  final int categoryId;
  final int mediaId;
  final bool isNew;
  final String status;
  final String brandName;

  CreateProductDto({
    required this.productName,
    required this.productPrice,
    required this.appliancesCharacterics,
    required this.notebookCharacterics,
    required this.phoneCharacterics,
    required this.currencyId,
    required this.productYearPrice,
    required this.description,
    required this.categoryId,
    required this.mediaId,
    required this.isNew,
    required this.status,
    required this.brandName,
  });

  factory CreateProductDto.fromJson(Map<String, dynamic> json) =>
      CreateProductDto(
        productName: json['product_name'] as String? ?? "",
        productPrice: json['product_price'] as double? ?? 0.0,
        appliancesCharacterics: json['appliances_characterics'] as int? ?? 0,
        notebookCharacterics: json['notebook_characterics'] as int? ?? 0,
        phoneCharacterics: json['phone_characterics'] as int? ?? 0,
        currencyId: json['currency_id'] as int? ?? 0,
        productYearPrice: json['product_year_price'] as int? ?? 0,
        description: json['description'] as String? ?? "",
        categoryId: json['category_id'] as int? ?? 0,
        mediaId: json['media_id'] as int? ?? 0,
        isNew: json['is_new'] as bool? ?? false,
        status: json['status'] as String? ?? "",
        brandName: json['brand_name'] as String? ?? "",
      );
}
