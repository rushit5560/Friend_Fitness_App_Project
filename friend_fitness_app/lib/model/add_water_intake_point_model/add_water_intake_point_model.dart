// To parse this JSON data, do
//
//     final addWaterIntakePointListModel = addWaterIntakePointListModelFromJson(jsonString);

import 'dart:convert';

AddWaterIntakePointListModel addWaterIntakePointListModelFromJson(String str) => AddWaterIntakePointListModel.fromJson(json.decode(str));

String addWaterIntakePointListModelToJson(AddWaterIntakePointListModel data) => json.encode(data.toJson());

class AddWaterIntakePointListModel {
  AddWaterIntakePointListModel({
    required this.success,
    required this.messege,
    required this.errorMessage
  });

  bool success;
  String messege;
  String errorMessage;

  factory AddWaterIntakePointListModel.fromJson(Map<String, dynamic> json) => AddWaterIntakePointListModel(
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
