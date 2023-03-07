
import 'package:ishonch/data/models/model_category/categories/product/product_model.dart';

class CategoryModel {
  int id;
  String categoryName;
  String categoryImage;
  // String parentCategoryId;
  // String createdAt;
  // String updatedAt;
  List<ProductModel> product;
  // List discount;

  CategoryModel({
      required this.id,
      required this.categoryName,
      required this.categoryImage,
      // required this.parentCategoryId,
      // required this.createdAt,
      // required this.updatedAt,
      required this.product,
      // required this.discount

      });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
        id: jsonData['id'] ?? 0,
        categoryName: jsonData['category_name'] ?? '',
        categoryImage: jsonData['category_image'] ?? '',
        // parentCategoryId: jsonData['parent_category_id'] ?? '',
        // createdAt: jsonData['createdAt'] ?? '',
        // updatedAt: jsonData['updatedAt'] ?? '',
        product: (jsonData['product'] as List).map((e) => ProductModel.fromJson(e)).toList(),
        // discount: jsonData['updatedAt'] ?? [],
        );
  }
}
