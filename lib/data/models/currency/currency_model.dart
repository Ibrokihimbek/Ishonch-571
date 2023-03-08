class Currency {
  final int id;
  final String currencyName;

  Currency({
    required this.id,
    required this.currencyName,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json['id'] as int? ?? 0,
        currencyName: json['currency_name'] as String? ?? "",
      );
}
