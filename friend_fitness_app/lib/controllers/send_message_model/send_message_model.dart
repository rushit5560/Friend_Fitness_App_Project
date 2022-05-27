// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
  SendMessageModel({
    required this.success,
    required this.messege,
    required this.errorMessage

  });

  bool success;
  String messege;
  String errorMessage;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
      errorMessage: json["error"] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "error" : errorMessage,
  };
}
