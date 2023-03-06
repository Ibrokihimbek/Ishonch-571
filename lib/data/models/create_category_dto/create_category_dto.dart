class CreateCategoryDto {
  final String categoryName;
  final int parentCategoryId;

  CreateCategoryDto({
    required this.categoryName,
    required this.parentCategoryId,
  });

  factory CreateCategoryDto.fromJson(Map<String, dynamic> json) =>
      CreateCategoryDto(
        categoryName: json['category_name'] as String? ?? "",
        parentCategoryId: json['parent_category_id'] as int? ?? 0,
      );
}
