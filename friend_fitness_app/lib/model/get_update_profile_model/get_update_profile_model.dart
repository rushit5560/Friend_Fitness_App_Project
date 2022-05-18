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
  });

  int the0;
  bool success;
  String messege;

  factory GetUserUpdateProfileModel.fromJson(Map<String, dynamic> json) => GetUserUpdateProfileModel(
    the0: json["0"] ?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
  };
}
