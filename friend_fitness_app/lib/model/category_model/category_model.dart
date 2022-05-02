class CategoryModel {
  int categoryId;
  String categoryName;
  String categoryImg;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImg,
  });

  static CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json['category_id'] ?? 0,
    categoryName: json['category_name'] ?? "",
    categoryImg: json['category_image'] ?? "",
  );
}
