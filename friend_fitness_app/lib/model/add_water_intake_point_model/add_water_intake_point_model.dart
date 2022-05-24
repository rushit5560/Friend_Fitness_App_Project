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
  });

  bool success;
  String messege;

  factory AddWaterIntakePointListModel.fromJson(Map<String, dynamic> json) => AddWaterIntakePointListModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
