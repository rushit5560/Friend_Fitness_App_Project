// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  ChangePasswordModel({
    required this.success,
    required this.message,
    required this.list,
  });

  bool success;
  String message;
  ListClass list;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    success: json["success"] ?? false,
    message: json["message"] ?? "",
    list: ListClass.fromJson(json["list"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "list": list.toJson(),
  };
}

class ListClass {
  ListClass({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.roleid,
    required this.address,
    required this.gender,
    required this.image,
    required this.beforeimage,
    required this.afterimage,
    required this.height,
    required this.weight,
    required this.chest,
    required this.lArm,
    required this.rArm,
    required this.walst,
    required this.hlps,
    required this.lThigh,
    required this.rThigh,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
  String password;
  int roleid;
  String address;
  String gender;
  String image;
  String beforeimage;
  String afterimage;
  String height;
  String weight;
  String chest;
  String lArm;
  String rArm;
  String walst;
  String hlps;
  String lThigh;
  String rThigh;
  String rememberToken;
  String createdAt;
  String updatedAt;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
    password: json["password"] ?? "",
    roleid: json["roleid"] ?? 0,
    address: json["address"] ?? "",
    gender: json["gender"] ?? "",
    image: json["image"] ?? "",
    beforeimage: json["beforeimage"] ?? "",
    afterimage: json["afterimage"] ?? "",
    height: json["height"] ?? "",
    weight: json["weight"] ?? "",
    chest: json["chest"] ?? "",
    lArm: json["l_arm"] ?? "",
    rArm: json["r_arm"] ?? "",
    walst: json["walst"] ?? "",
    hlps: json["hlps"] ?? "",
    lThigh: json["l_thigh"] ?? "",
    rThigh: json["r_thigh"] ?? "",
    rememberToken: json["remember_token"] ?? "",
    createdAt: json["created_at"] ?? "",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "roleid": roleid,
    "address": address,
    "gender": gender,
    "image": image,
    "beforeimage": beforeimage,
    "afterimage": afterimage,
    "height": height,
    "weight": weight,
    "chest": chest,
    "l_arm": lArm,
    "r_arm": rArm,
    "walst": walst,
    "hlps": hlps,
    "l_thigh": lThigh,
    "r_thigh": rThigh,
    "remember_token": rememberToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
