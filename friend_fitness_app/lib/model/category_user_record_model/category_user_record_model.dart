import 'dart:convert';

CategoryUserEntryModel categoryUserEntryModelFromJson(String str) => CategoryUserEntryModel.fromJson(json.decode(str));

String categoryUserEntryModelToJson(CategoryUserEntryModel data) => json.encode(data.toJson());

class CategoryUserEntryModel {
  CategoryUserEntryModel({
    required this.categoryId,
    required this.categoryName,
    required this.date,
    required this.id,
    required this.point,
    required this.userId,
  });

  String categoryId;
  String categoryName;
  String date;
  String id;
  double point;
  String userId;

  factory CategoryUserEntryModel.fromJson(Map<String, dynamic> json) => CategoryUserEntryModel(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    date: json["date"],
    id: json["id"],
    point: json["point"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "date": date,
    "id": id,
    "point": point,
    "user_id": userId,
  };
}