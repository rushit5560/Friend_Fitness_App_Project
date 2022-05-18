// To parse this JSON data, do
//
//     final getAllNegativeCategoryModel = getAllNegativeCategoryModelFromJson(jsonString);

import 'dart:convert';

GetAllNegativeCategoryModel getAllNegativeCategoryModelFromJson(String str) => GetAllNegativeCategoryModel.fromJson(json.decode(str));

String getAllNegativeCategoryModelToJson(GetAllNegativeCategoryModel data) => json.encode(data.toJson());

class GetAllNegativeCategoryModel {
  GetAllNegativeCategoryModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.list,
  });

  int the0;
  bool success;
  String messege;
  List<ListElement1> list;

  factory GetAllNegativeCategoryModel.fromJson(Map<String, dynamic> json) => GetAllNegativeCategoryModel(
    the0: json["0"] ?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: List<ListElement1>.from(json["list"].map((x) => ListElement1.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement1 {
  ListElement1({
    required this.id,
    required this.name,
    required this.time,
    required this.type,
    required this.point,
    required this.image,
  });

  int id;
  String name;
  int time;
  String type;
  double point;
  String image;

  factory ListElement1.fromJson(Map<String, dynamic> json) => ListElement1(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    time: json["time"] ?? 0,
    type: json["type"] ?? "",
    point: json["point"].toDouble(),
    image: json["image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "time": time,
    "type": type,
    "point": point,
    "image": image,
  };
}
