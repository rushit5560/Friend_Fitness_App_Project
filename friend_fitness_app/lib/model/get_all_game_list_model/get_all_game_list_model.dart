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
  List<ListElement1> list;

  factory GetAllGameListModel.fromJson(Map<String, dynamic> json) => GetAllGameListModel(
    the0: json["0"]?? 0,
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
    required this.days,
    required this.person,
    required this.amount,
    required this.rewardpoints,
    required this.startdate,
    required this.enddate,
    required this.userid,
    required this.status,
    required this.cheatday,
  });

  int id;
  String name;
  int days;
  int person;
  int amount;
  int rewardpoints;
  String startdate;
  String enddate;
  int userid;
  String status;
  String cheatday;

  factory ListElement1.fromJson(Map<String, dynamic> json) => ListElement1(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    days: json["days"] ?? 0,
    person: json["person"] ?? 0,
    amount: json["amount"] ?? 0,
    rewardpoints: json["rewardpoints"] ?? 0,
    startdate: json["startdate"] ?? "",
    enddate: json["enddate"] ?? "",
    userid: json["userid"] ?? 0,
    status: json["status"] ?? "",
    cheatday: json["cheatday"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "days": days,
    "person": person,
    "amount": amount,
    "rewardpoints": rewardpoints,
    "startdate": startdate == null ? null : startdate,
    "enddate": enddate == null ? null : enddate,
    "userid": userid,
    "status": status,
    "cheatday": cheatday == null ? null : cheatday,
  };
}
