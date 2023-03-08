class UpdatePriceYearDto {
  final int priceYear;
  final double pricePerMonth;
  final int numberOfMonth;

  UpdatePriceYearDto({
    required this.priceYear,
    required this.pricePerMonth,
    required this.numberOfMonth,
  });

  factory UpdatePriceYearDto.fromJson(Map<String, dynamic> json) =>
      UpdatePriceYearDto(
        priceYear: json['price_year'] as int? ?? 0,
        pricePerMonth: json['number_of_month'] as double? ?? 0.0,
        numberOfMonth: json['price_year'] as int? ?? 0,
      );
}
