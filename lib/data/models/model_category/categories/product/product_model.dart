class ProductModel {
  int id;
  String productName;
  int productPrice;
  // String brandName;
  // int appliancesCharacterics;
  // String notebookCharacterics;
  // String phoneCharacterics;
  // int currencyId;
  // int productYearPrice;
  // String description;
  // int categoryId;
  // int mediaId;
  // bool isNew;
  // String status;
  // String createdAt;
  // String updatedAt;

  ProductModel({
      required this.id,
      required this.productName,
      required this.productPrice,
      // required this.brandName,
      // required this.appliancesCharacterics,
      // required this.notebookCharacterics,
      // required this.phoneCharacterics,
      // required this.currencyId,
      // required this.productYearPrice,
      // required this.description,
      // required this.categoryId,
      // required this.mediaId,
      // required this.isNew,
      // required this.status,
      // required this.createdAt,
      // required this.updatedAt
      });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
        id: jsonData['id'] ?? 0,
        productName: jsonData['product_name'] ?? '',
        productPrice: jsonData['product_price'] ?? 0,
        // brandName: jsonData['brand_name'] ?? '',
        // appliancesCharacterics: jsonData['appliances_characterics'] ?? 0,
        // notebookCharacterics: jsonData['notebook_characterics'] ?? '',
        // phoneCharacterics: jsonData['phone_characterics'] ?? '',
        // currencyId: jsonData['currency_id'] ?? 0,
        // productYearPrice: jsonData['product_year_price'] ?? 0,
        // description: jsonData['description'] ?? '',
        // categoryId: jsonData['category_id'] ?? 0,
        // mediaId: jsonData['media_id'] ?? 0,
        // isNew: jsonData['isNew'] ?? false,
        // status: jsonData['status'] ?? '',
        // createdAt: jsonData['createdAt'] ?? '',
        // updatedAt: jsonData['updatedAt'] ?? '',
      );
  }
}