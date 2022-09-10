// To parse this JSON data, do
//
//     final winnerGameMemberModel = winnerGameMemberModelFromJson(jsonString);

import 'dart:convert';

WinnerGameMemberModel winnerGameMemberModelFromJson(String str) => WinnerGameMemberModel.fromJson(json.decode(str));

String winnerGameMemberModelToJson(WinnerGameMemberModel data) => json.encode(data.toJson());

class WinnerGameMemberModel {
  WinnerGameMemberModel({
    required this.success,
    required this.messege,
  });

  bool success;
  String messege;

  factory WinnerGameMemberModel.fromJson(Map<String, dynamic> json) => WinnerGameMemberModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
  };
}
