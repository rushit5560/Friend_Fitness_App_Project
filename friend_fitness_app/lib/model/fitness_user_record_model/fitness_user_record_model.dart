import 'dart:convert';

FitnessUserEntryModel fitnessUserEntryModelFromJson(String str) => FitnessUserEntryModel.fromJson(json.decode(str));

String fitnessUserEntryModelToJson(FitnessUserEntryModel data) => json.encode(data.toJson());

class FitnessUserEntryModel {
  FitnessUserEntryModel({
    required this.date,
    required this.fitnessCategoryName,
    required this.fitnessId,
    required this.fitnessName,
    required this.id,
    required this.point,
    required this.userId,
  });

  String date;
  String fitnessCategoryName;
  String fitnessId;
  String fitnessName;
  String id;
  double point;
  String userId;

  factory FitnessUserEntryModel.fromJson(Map<String, dynamic> json) => FitnessUserEntryModel(
    date: json["date"],
    fitnessCategoryName: json["fitness_category_name"],
    fitnessId: json["fitness_id"],
    fitnessName: json["fitness_name"],
    id: json["id"],
    point: double.parse(json["point"].toString()),
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "fitness_category_name": fitnessCategoryName,
    "fitness_id": fitnessId,
    "fitness_name": fitnessName,
    "id": id,
    "point": point,
    "user_id": userId,
  };
}