class PriceYear {
  final int id;
  final int priceYear;
  final double pricePerMonth;
  final int numberOfMonth;

  PriceYear({
    required this.id,
    required this.priceYear,
    required this.pricePerMonth,
    required this.numberOfMonth,
  });

  factory PriceYear.fromJson(Map<String, dynamic> json) => PriceYear(
        id: json['id'] as int? ?? 0,
        priceYear: json['price_year'] as int? ?? 0,
        pricePerMonth: json['number_of_month'] as double? ?? 0.0,
        numberOfMonth: json['price_year'] as int? ?? 0,
      );
}
