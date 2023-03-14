import 'package:ishonch/data/models/appliances/appliances.dart';
import 'package:ishonch/data/models/media/media_model.dart';
import 'package:ishonch/data/models/notebook/notebook_model.dart';
import 'package:ishonch/data/models/phone/phone_model.dart';
import 'package:ishonch/data/models/currency/currency_model.dart';

class ProductModel {
  int id;
  String productName;
  int productPrice;
  String brandName;
  int appliancesCharacterics;
  int notebookCharacterics;
  int phoneCharacterics;
  int currencyId;
  int productYearPrice;
  String description;
  int categoryId;
  int mediaId;
  bool isNew;
  String status;
  String createdAt;
  String updatedAt;
  Media media;
  Phone phone;
  Currency currency;
  Notebook notebook;
  Appliances appliances;

  ProductModel({
    required this.appliances,
    required this.notebook,
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.media,
    required this.phone,
    required this.currency,
    required this.brandName,
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
    required this.createdAt,
    required this.updatedAt
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      notebook: Notebook.fromJson(
        jsonData['notebook'] as Map<String, dynamic>? ?? {},
      ),
      appliances: Appliances.fromJson(
        jsonData['appliances'] as Map<String, dynamic>? ?? {},
      ),
      currency: Currency.fromJson(
        jsonData['currensy'] as Map<String, dynamic>? ?? {},
      ),
      phone: Phone.fromJson(
        jsonData['phone'] as Map<String, dynamic>? ?? {},
      ),
      media: Media.fromJson(
        jsonData['media'] as Map<String, dynamic>? ?? {},
      ),
      id: jsonData['id'] ?? 0,
      productName: jsonData['product_name'] ?? '',
      productPrice: jsonData['product_price'] ?? 0,
      brandName: jsonData['brand_name'] ?? '',
      appliancesCharacterics: jsonData['appliances_characterics'] ?? 0,
      notebookCharacterics: jsonData['notebook_characterics'] ?? 0,
      phoneCharacterics: jsonData['phone_characterics'] ?? 0,
      currencyId: jsonData['currency_id'] ?? 0,
      productYearPrice: jsonData['product_year_price'] ?? 0,
      description: jsonData['description'] ?? '',
      categoryId: jsonData['category_id'] ?? 0,
      mediaId: jsonData['media_id'] ?? 0,
      isNew: jsonData['isNew'] ?? false,
      status: jsonData['status'] ?? '',
      createdAt: jsonData['createdAt'] ?? '',
      updatedAt: jsonData['updatedAt'] ?? '',
    );
  }
}
