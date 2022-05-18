// To parse this JSON data, do
//
//     final categoryAddNegativePointModel = categoryAddNegativePointModelFromJson(jsonString);

import 'dart:convert';

CategoryAddNegativePointModel categoryAddNegativePointModelFromJson(String str) => CategoryAddNegativePointModel.fromJson(json.decode(str));

String categoryAddNegativePointModelToJson(CategoryAddNegativePointModel data) => json.encode(data.toJson());

class CategoryAddNegativePointModel {
  CategoryAddNegativePointModel({
    required this.success,
    required this.messege,
  });

  bool success;
  String messege;

  factory CategoryAddNegativePointModel.fromJson(Map<String, dynamic> json) => CategoryAddNegativePointModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
