// To parse this JSON data, do
//
//     final startGameModel = startGameModelFromJson(jsonString);

import 'dart:convert';

StartGameModel startGameModelFromJson(String str) => StartGameModel.fromJson(json.decode(str));

String startGameModelToJson(StartGameModel data) => json.encode(data.toJson());

class StartGameModel {
  StartGameModel({
    required this.success,
    required this.messege,
  });

  bool success;
  String messege;

  factory StartGameModel.fromJson(Map<String, dynamic> json) => StartGameModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
