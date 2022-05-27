// To parse this JSON data, do
//
//     final getAllPositiveCategoryModel = getAllPositiveCategoryModelFromJson(jsonString);

import 'dart:convert';

GetAllPositiveCategoryModel getAllPositiveCategoryModelFromJson(String str) => GetAllPositiveCategoryModel.fromJson(json.decode(str));

String getAllPositiveCategoryModelToJson(GetAllPositiveCategoryModel data) => json.encode(data.toJson());

class GetAllPositiveCategoryModel {
  GetAllPositiveCategoryModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.list,
    required this.errorMessage
  });

  int the0;
  bool success;
  String messege;
  List<ListElement> list;
  String errorMessage;

  factory GetAllPositiveCategoryModel.fromJson(Map<String, dynamic> json) => GetAllPositiveCategoryModel(
    the0: json["0"]?? 0,
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x)) ?? {}),
    errorMessage: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "success": success,
    "messege": messege,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "error" : errorMessage,
  };
}

class ListElement {
  ListElement({
    required this.id,
    required this.name,
    required this.time,
    required this.type,
    required this.point,
    required this.image,
  });

  int id;
  String name;
  double time;
  String type;
  double point;
  String image;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    time: json["time"].toDouble(),
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
    "image": image == null ? null : image,
  };
}
