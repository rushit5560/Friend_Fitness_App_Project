// To parse this JSON data, do
//
//     final categoryAddPositivePointModel = categoryAddPositivePointModelFromJson(jsonString);

import 'dart:convert';

CategoryAddPositivePointModel categoryAddPositivePointModelFromJson(String str) => CategoryAddPositivePointModel.fromJson(json.decode(str));

String categoryAddPositivePointModelToJson(CategoryAddPositivePointModel data) => json.encode(data.toJson());

class CategoryAddPositivePointModel {
  CategoryAddPositivePointModel({
    required this.success,
    required this.messege,
  });

  bool success;
  String messege;

  factory CategoryAddPositivePointModel.fromJson(Map<String, dynamic> json) => CategoryAddPositivePointModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
