class UpdateDiscountDto {
  final int discount;
  final String productName;
  final int productPrice;
  final int currencyId;
  final int productPriceYear;
  final int descriptionId;
  final int categoryId;
  final int mediaId;
  final int appliancesCharacterics;
  final int notebookCharacterics;
  final int phoneCharacterics;
  final bool isDelivery;
  final bool isNew;
  final int brandId;
  final int statusId;

  UpdateDiscountDto({
    required this.discount,
    required this.productName,
    required this.productPrice,
    required this.currencyId,
    required this.productPriceYear,
    required this.descriptionId,
    required this.categoryId,
    required this.mediaId,
    required this.appliancesCharacterics,
    required this.notebookCharacterics,
    required this.phoneCharacterics,
    required this.isDelivery,
    required this.isNew,
    required this.brandId,
    required this.statusId,
  });

  factory UpdateDiscountDto.fromJson(Map<String, dynamic> json) =>
      UpdateDiscountDto(
        discount: json['discount'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        productPrice: json['product_price'] as int? ?? 0,
        currencyId: json['currency_id'] as int? ?? 0,
        productPriceYear: json['product_price_year'] as int? ?? 0,
        descriptionId: json['description_id'] as int? ?? 0,
        categoryId: json['category_id'] as int? ?? 0,
        mediaId: json['media_id'] as int? ?? 0,
        appliancesCharacterics: json['appliances_characterics'] as int? ?? 0,
        notebookCharacterics: json['notebook_characterics'] as int? ?? 0,
        phoneCharacterics: json['phone_characterics'] as int? ?? 0,
        isDelivery: json['is_delivery'] as bool? ?? false,
        isNew: json['is_new'] as bool? ?? false,
        brandId: json['brand_id'] as int? ?? 0,
        statusId: json['status_id'] as int? ?? 0,
      );
}
