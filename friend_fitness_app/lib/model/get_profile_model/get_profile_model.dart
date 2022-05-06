// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.afterImage,
    required this.beforeImage,
    required this.email,
    required this.height,
    required this.id,
    required this.measurement,
    required this.name,
    required this.profileImage,
    required this.userId,
    required this.weight,
  });

  String afterImage;
  String beforeImage;
  String email;
  String height;
  String id;
  String measurement;
  String name;
  String profileImage;
  String userId;
  String weight;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    afterImage: json["after_image"] ?? "",
    beforeImage: json["before_image"] ?? "",
    email: json["email"] ?? "",
    height: json["height"] ?? "",
    id: json["id"] ?? "",
    measurement: json["measurement"] ?? "",
    name: json["name"] ?? "",
    profileImage: json["profile_image"] ?? "",
    userId: json["user_id"] ?? "",
    weight: json["weight"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "after_image": afterImage,
    "before_image": beforeImage,
    "email": email,
    "height": height,
    "id": id,
    "measurement": measurement,
    "name": name,
    "profile_image": profileImage,
    "user_id": userId,
    "weight": weight,
  };
}
