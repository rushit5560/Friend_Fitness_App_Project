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
    required this.errorMessage
  });

  bool success;
  String messege;
  String errorMessage;

  factory CategoryAddNegativePointModel.fromJson(Map<String, dynamic> json) => CategoryAddNegativePointModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    errorMessage: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "error" : errorMessage,
  };
}
