class CreateCurrencyDto {
  final String currencyName;

  CreateCurrencyDto({required this.currencyName});

  factory CreateCurrencyDto.fromJson(Map<String, dynamic> json) =>
      CreateCurrencyDto(
        currencyName: json['currency_name'] as String? ?? "",
      );
}
