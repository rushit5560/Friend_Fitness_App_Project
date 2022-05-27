// To parse this JSON data, do
//
//     final addStarPointModel = addStarPointModelFromJson(jsonString);

import 'dart:convert';

AddStarPointModel addStarPointModelFromJson(String str) => AddStarPointModel.fromJson(json.decode(str));

String addStarPointModelToJson(AddStarPointModel data) => json.encode(data.toJson());

class AddStarPointModel {
  AddStarPointModel({
    required this.success,
    required this.messege,
    required this.errorMessage,
  });

  bool success;
  String messege;
  String errorMessage;

  factory AddStarPointModel.fromJson(Map<String, dynamic> json) => AddStarPointModel(
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
