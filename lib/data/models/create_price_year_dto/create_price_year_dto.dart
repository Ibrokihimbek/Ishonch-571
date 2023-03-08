class CreatePriceYearDto {
  final int priceYear;
  final double pricePerMonth;
  final int numberOfMonth;

  CreatePriceYearDto({
    required this.priceYear,
    required this.pricePerMonth,
    required this.numberOfMonth,
  });

  factory CreatePriceYearDto.fromJson(Map<String, dynamic> json) =>
      CreatePriceYearDto(
        priceYear: json['price_year'] as int? ?? 0,
        pricePerMonth: json['number_of_month'] as double? ?? 0.0,
        numberOfMonth: json['price_year'] as int? ?? 0,
      );
}
