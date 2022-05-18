// To parse this JSON data, do
//
//     final userSignInModel = userSignInModelFromJson(jsonString);

import 'dart:convert';

UserSignInModel userSignInModelFromJson(String str) => UserSignInModel.fromJson(json.decode(str));

String userSignInModelToJson(UserSignInModel data) => json.encode(data.toJson());

class UserSignInModel {
  UserSignInModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.list,
  });

  int the0;
  bool success;
  String messege;
  List<ListElement> list;

  factory UserSignInModel.fromJson(Map<String, dynamic> json) => UserSignInModel(
    the0: json["0"] ?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    required this.id,
    required this.name,
    required this.email,
    required this.rememberToken,
  });

  int id;
  String name;
  String email;
  String rememberToken;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    rememberToken: json["remember_token"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "remember_token": rememberToken,
  };
}
