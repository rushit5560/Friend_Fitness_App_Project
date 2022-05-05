import 'dart:convert';

FitnessModel fitnessModelFromJson(String str) => FitnessModel.fromJson(json.decode(str));

String fitnessModelToJson(FitnessModel data) => json.encode(data.toJson());

class FitnessModel {
  FitnessModel({
    required this.fitnessId,
    required this.fitnessCategoryName,
    required this.fitnessName,
    required this.fitnessImage,
    required this.fitnessPoint,
  });

  String fitnessId;
  String fitnessCategoryName;
  String fitnessName;
  String fitnessImage;
  double fitnessPoint;

  factory FitnessModel.fromJson(Map<String, dynamic> json) => FitnessModel(
    fitnessId: json["fitness_id"] ?? "",
    fitnessCategoryName: json["fitness_category_name"] ?? "",
    fitnessName: json["fitness_name"] ?? "",
    fitnessImage: json["fitness_image"] ?? "",
    fitnessPoint: json["fitness_point"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "fitness_id": fitnessId,
    "fitness_category_name": fitnessCategoryName,
    "fitness_name": fitnessName,
    "fitness_image": fitnessImage,
    "fitness_point": fitnessPoint,
  };
}