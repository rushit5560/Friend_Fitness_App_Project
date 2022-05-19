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
  });

  bool success;
  String messege;

  factory MemberJoinGameModel.fromJson(Map<String, dynamic> json) => MemberJoinGameModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
