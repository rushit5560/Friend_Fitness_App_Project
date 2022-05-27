// To parse this JSON data, do
//
//     final userSignUpModel = userSignUpModelFromJson(jsonString);

import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    success: json["success"] ?? false,
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)) ?? {}),
    message: json["message"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
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
    required this.createdAt,
    required this.updatedAt,
    required this.otp,
    required this.gameid,
  });

  int id;
  String name;
  String email;
  String emailVerifiedAt;
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
  DateTime createdAt;
  DateTime updatedAt;
  String otp;
  String gameid;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    emailVerifiedAt: json["email_verified_at"] ?? "",
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
    createdAt: DateTime.parse(json["created_at"] ?? DateTime.now()),
    updatedAt: DateTime.parse(json["updated_at"] ?? DateTime.now()),
    otp: json["otp"] ?? "",
    gameid: json["gameid"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "otp": otp,
    "gameid": gameid,
  };
}
