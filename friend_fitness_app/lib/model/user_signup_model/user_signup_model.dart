// To parse this JSON data, do
//
//     final userSignUpModel = userSignUpModelFromJson(jsonString);

import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.the0,
    required this.success,
    required this.messege,
    //required this.error,
    required this.list,
  });

  int the0;
  bool success;
  String messege;
 // Error error;
  List<ListElement> list;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    the0: json["0"] ?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    //error: Error.fromJson(json["error"] ?? {}),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
    //"error": error.toJson(),
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

/*class Error {
  Error({
    required this.email,
  });

  List<String> email;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    email: List<String>.from(json["email"].map((x) => x) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "email": List<dynamic>.from(email.map((x) => x)),
  };
}*/

class ListElement {
  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
  };
}
