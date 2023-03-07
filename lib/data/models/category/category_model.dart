class Category {
  final int id;
  final String categoryName;
  final String categoryImage;
  final int parentCategoryId;

  Category(
      {required this.id,
      required this.categoryName,
      required this.categoryImage,
      required this.parentCategoryId});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int? ?? 0,
        categoryName: json['category_name'] as String? ?? "",
        categoryImage: json['category_image'] as String? ?? "",
        parentCategoryId: json['parent_category_id'] as int? ?? 0,
      );
}
