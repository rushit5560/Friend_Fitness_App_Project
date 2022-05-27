// To parse this JSON data, do
//
//     final memberJoinGameModel = memberJoinGameModelFromJson(jsonString);

import 'dart:convert';

MemberJoinGameModel memberJoinGameModelFromJson(String str) => MemberJoinGameModel.fromJson(json.decode(str));

String memberJoinGameModelToJson(MemberJoinGameModel data) => json.encode(data.toJson());

class MemberJoinGameModel {
  MemberJoinGameModel({
    required this.success,
    required this.messege,
    required this.errorMessage
  });

  bool success;
  String messege;
  String errorMessage;

  factory MemberJoinGameModel.fromJson(Map<String, dynamic> json) => MemberJoinGameModel(
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
