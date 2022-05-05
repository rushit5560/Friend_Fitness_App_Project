class CategoryModel {
  String categoryId;
  String categoryName;
  String categoryImg;
  int categoryPoint;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImg,
    required this.categoryPoint,
  });

  static CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryId: json['category_id'] ?? "",
    categoryName: json['category_name'] ?? "",
    categoryImg: json['category_image'] ?? "",
    categoryPoint: json['category_point'] ?? 0,
  );
}
