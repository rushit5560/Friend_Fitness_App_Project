// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    required this.afterImage,
    required this.beforeImage,
    required this.weight,
    required this.name,
    required this.email,
    required this.height,
    required this.userId,
    required this.id,
    required this.measurement,
    required this.profileImage,
  });

  String afterImage;
  String beforeImage;
  String weight;
  String name;
  String email;
  String height;
  String userId;
  String id;
  String measurement;
  String profileImage;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    afterImage: json["after_image"] ?? "",
    beforeImage: json["before_image"] ?? "",
    weight: json["weight"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    height: json["height"] ?? "",
    userId: json["user_id"] ?? "",
    id: json["id"] ?? "",
    measurement: json["measurement"] ?? "",
    profileImage: json["profile_image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "after_image": afterImage,
    "before_image": beforeImage,
    "weight": weight,
    "name": name,
    "email": email,
    "height": height,
    "user_id": userId,
    "id": id,
    "measurement": measurement,
    "profile_image": profileImage,
  };
}
