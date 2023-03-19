import 'package:flutter/material.dart';

class DiscountEmpty {
  final String image;
  final String description;
  final Color color;

  DiscountEmpty(
      {required this.image, required this.description, required this.color});

  static List<DiscountEmpty> discountEmpty = [
    DiscountEmpty(
      image: 'assets/images/home_appliance.png',
      description: 'Sevimli_texnikalaringizni_toping',
      color: Colors.blue,
    ),
    DiscountEmpty(
      image: 'assets/images/easy_paymnet.png',
      description: "Oson_va_xavfsiz_to'lov",
      color: Colors.deepPurpleAccent.shade700,
    ),
    DiscountEmpty(
      image: 'assets/images/delivery_product.png',
      description: 'Yetkazib_berish_xizmatini_taqdim_etishga_tayyormiz',
      color: Colors.pink.shade400,
    ),
  ];
}
