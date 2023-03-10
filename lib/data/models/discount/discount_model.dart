import 'package:ishonch/data/models/appliances/appliances.dart';
import 'package:ishonch/data/models/currency/currency_model.dart';
import 'package:ishonch/data/models/media/media_model.dart';
import 'package:ishonch/data/models/notebook/notebook_model.dart';
import 'package:ishonch/data/models/phone/phone_model.dart';

class Discount {
  final int id;
  final int discount;
  final int appliancesCharacterics;
  final int notebookCharacterics;
  final int phoneCharacterics;
  final String productName;
  final String productPrice;
  final String description;
  final bool isDelivery;
  final bool isNew;
  final Media media;
  final Currency currency;
  final Notebook notebook;
  final Phone phone;
  final Appliances appliances;

  Discount({
    required this.appliancesCharacterics,
    required this.notebookCharacterics,
    required this.phoneCharacterics,
    required this.media,
    required this.currency,
    required this.notebook,
    required this.phone,
    required this.appliances,
    required this.id,
    required this.discount,
    required this.productName,
    required this.productPrice,
    required this.isDelivery,
    required this.isNew,
    required this.description,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        appliancesCharacterics: json['appliances_characterics'] ?? 0,
        notebookCharacterics: json['notebook_characterics'] ?? 0,
        phoneCharacterics: json['phone_characterics'] ?? 0,
        phone: Phone.fromJson(json['phone'] as Map<String, dynamic>? ?? {}),
        notebook:
            Notebook.fromJson(json['notebook'] as Map<String, dynamic>? ?? {}),
        appliances: Appliances.fromJson(
            json['appliances'] as Map<String, dynamic>? ?? {}),
        currency:
            Currency.fromJson(json['currency'] as Map<String, dynamic>? ?? {}),
        media: Media.fromJson(json['media'] as Map<String, dynamic>? ?? {}),
        id: json['id'] as int? ?? 0,
        discount: json['discount'] as int? ?? 0,
        productName: json['product_name'] as String? ?? "",
        description: json['description'] as String? ?? "",
        productPrice: json['product_price'] as String? ?? '',
        isDelivery: json['is_delivery'] as bool? ?? false,
        isNew: json['is_new'] as bool? ?? false,
      );
}
