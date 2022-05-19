// To parse this JSON data, do
//
//     final endGameModel = endGameModelFromJson(jsonString);

import 'dart:convert';

EndGameModel endGameModelFromJson(String str) => EndGameModel.fromJson(json.decode(str));

String endGameModelToJson(EndGameModel data) => json.encode(data.toJson());

class EndGameModel {
  EndGameModel({
    required this.success,
    required this.messege,
  });

  bool success;
  String messege;

  factory EndGameModel.fromJson(Map<String, dynamic> json) => EndGameModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
