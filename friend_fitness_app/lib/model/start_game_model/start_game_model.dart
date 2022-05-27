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
    required this.errorMessage
  });

  bool success;
  String messege;
  String errorMessage;

  factory StartGameModel.fromJson(Map<String, dynamic> json) => StartGameModel(
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
