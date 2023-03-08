class UpdateCategoryDto {
  final String categoryName;
  final int parentCategoryId;

  UpdateCategoryDto({
    required this.categoryName,
    required this.parentCategoryId,
  });

  factory UpdateCategoryDto.fromJson(Map<String, dynamic> json) =>
      UpdateCategoryDto(
        categoryName: json['category_name'] as String? ?? "",
        parentCategoryId: json['parent_category_id'] as int? ?? 0,
      );
}
