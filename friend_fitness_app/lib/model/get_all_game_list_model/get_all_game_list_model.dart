// To parse this JSON data, do
//
//     final getAllGameListModel = getAllGameListModelFromJson(jsonString);

import 'dart:convert';

GetAllGameListModel getAllGameListModelFromJson(String str) => GetAllGameListModel.fromJson(json.decode(str));

String getAllGameListModelToJson(GetAllGameListModel data) => json.encode(data.toJson());

class GetAllGameListModel {
  GetAllGameListModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.list,
  });

  int the0;
  bool success;
  String messege;
  List<ListElement> list;

  factory GetAllGameListModel.fromJson(Map<String, dynamic> json) => GetAllGameListModel(
    the0: json["0"]?? 0,
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
    required this.days,
    required this.person,
    required this.amount,
    required this.rewardpoints,
    required this.startdate,
  });

  int id;
  String name;
  int days;
  int person;
  int amount;
  int rewardpoints;
  String startdate;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    days: json["days"] ?? 0,
    person: json["person"] ?? 0,
    amount: json["amount"] ?? 0,
    rewardpoints: json["rewardpoints"] ?? 0,
    startdate: json["startdate"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "days": days,
    "person": person,
    "amount": amount,
    "rewardpoints": rewardpoints,
    "startdate": startdate == null ? null : startdate,
  };
}
