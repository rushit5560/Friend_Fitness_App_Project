import 'dart:convert';

WaterIntakeEntryModel waterIntakeEntryModelFromJson(String str) => WaterIntakeEntryModel.fromJson(json.decode(str));

String waterIntakeEntryModelToJson(WaterIntakeEntryModel data) => json.encode(data.toJson());

class WaterIntakeEntryModel {
  WaterIntakeEntryModel({
    required this.date,
    required this.id,
    required this.point,
    required this.userId,
    required this.waterIntakeId,
    required this.waterIntakeName,
  });

  String date;
  String id;
  double point;
  String userId;
  String waterIntakeId;
  String waterIntakeName;

  factory WaterIntakeEntryModel.fromJson(Map<String, dynamic> json) => WaterIntakeEntryModel(
    date: json["date"] ?? "",
    id: json["id"] ?? "",
    point: double.parse(json["point"].toString()),
    userId: json["user_id"] ?? "",
    waterIntakeId: json["water_intake_id"] ?? "",
    waterIntakeName: json["water_intake_name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "id": id,
    "point": point,
    "user_id": userId,
    "water_intake_id": waterIntakeId,
    "water_intake_name": waterIntakeName,
  };
}