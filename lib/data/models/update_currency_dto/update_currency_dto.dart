class UpdateCurrencyDto {
  String currencyName;

  UpdateCurrencyDto({required this.currencyName});

  factory UpdateCurrencyDto.fromJson(Map<String, dynamic> json) =>
      UpdateCurrencyDto(
        currencyName: json['currency_name'] as String? ?? "",
      );
}
