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
  });

  bool success;
  String messege;

  factory AddStarPointModel.fromJson(Map<String, dynamic> json) => AddStarPointModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
