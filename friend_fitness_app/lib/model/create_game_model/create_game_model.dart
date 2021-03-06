// To parse this JSON data, do
//
//     final createGameModel = createGameModelFromJson(jsonString);

import 'dart:convert';

CreateGameModel createGameModelFromJson(String str) => CreateGameModel.fromJson(json.decode(str));

String createGameModelToJson(CreateGameModel data) => json.encode(data.toJson());

class CreateGameModel {
  CreateGameModel({
    required this.success,
    required this.messege,
    required this.errorMessage
  });

  bool success;
  String messege;
  String errorMessage;

  factory CreateGameModel.fromJson(Map<String, dynamic> json) => CreateGameModel(
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
