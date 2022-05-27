// To parse this JSON data, do
//
//     final getUserUpdateProfileModel = getUserUpdateProfileModelFromJson(jsonString);

import 'dart:convert';

GetUserUpdateProfileModel getUserUpdateProfileModelFromJson(String str) => GetUserUpdateProfileModel.fromJson(json.decode(str));

String getUserUpdateProfileModelToJson(GetUserUpdateProfileModel data) => json.encode(data.toJson());

class GetUserUpdateProfileModel {
  GetUserUpdateProfileModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.errorMessage,
  });

  int the0;
  bool success;
  String messege;
  String errorMessage;

  factory GetUserUpdateProfileModel.fromJson(Map<String, dynamic> json) => GetUserUpdateProfileModel(
    the0: json["0"] ?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    errorMessage: json["error"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
    "error" : errorMessage,
  };
}
