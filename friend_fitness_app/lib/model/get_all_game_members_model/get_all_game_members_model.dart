// To parse this JSON data, do
//
//     final getAllGameMembersModel = getAllGameMembersModelFromJson(jsonString);

import 'dart:convert';

GetAllGameMembersModel getAllGameMembersModelFromJson(String str) => GetAllGameMembersModel.fromJson(json.decode(str));

String getAllGameMembersModelToJson(GetAllGameMembersModel data) => json.encode(data.toJson());

class GetAllGameMembersModel {
  GetAllGameMembersModel({
    required this.success,
    required this.messege,
    required this.list,
  });

  bool success;
  String messege;
  List<ListElement> list;

  factory GetAllGameMembersModel.fromJson(Map<String, dynamic> json) => GetAllGameMembersModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    required this.id,
    required this.gameid,
    required this.userid,
    required this.categoryid,
    required this.point,
    required this.joindate,
    required this.name,
    required this.days,
    required this.person,
    required this.amount,
    required this.rewardpoints,
    required this.startdate,
    required this.gamename,
    required this.gamedays,
    required this.gameperson,
    required this.gameamount,
    required this.gamerewardpoints,
    required this.gamestartdate,
    required this.categoryname,
    required this.categorytime,
    required this.categorytype,
    required this.categorypoint,
    required this.categoryimage,
  });

  String id;
  String gameid;
  String userid;
  String categoryid;
  int point;
  String joindate;
  String name;
  String days;
  String person;
  String amount;
  String rewardpoints;
  String startdate;
  String gamename;
  String gamedays;
  String gameperson;
  String gameamount;
  String gamerewardpoints;
  String gamestartdate;
  String categoryname;
  String categorytime;
  String categorytype;
  String categorypoint;
  String categoryimage;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? "",
    gameid: json["gameid"] ?? "",
    userid: json["userid"] ?? "",
    categoryid: json["categoryid"] ?? "",
    point: json["point"] ?? 0,
    joindate: json["joindate"] ?? "",
    name: json["name"] ?? "",
    days: json["days"] ?? "",
    person: json["person"] ?? "",
    amount: json["amount"] ?? "",
    rewardpoints: json["rewardpoints"] ?? "",
    startdate: json["startdate"] ?? "",
    gamename: json["gamename"] ?? "",
    gamedays: json["gamedays"] ?? "",
    gameperson: json["gameperson"] ?? "",
    gameamount: json["gameamount"] ?? "",
    gamerewardpoints: json["gamerewardpoints"] ?? "",
    gamestartdate: json["gamestartdate"] ?? "",
    categoryname: json["categoryname"] ?? "",
    categorytime: json["categorytime"] ?? "",
    categorytype: json["categorytype"] ?? "",
    categorypoint: json["categorypoint"] ?? "",
    categoryimage: json["categoryimage"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gameid": gameid,
    "userid": userid,
    "categoryid": categoryid,
    "point": point,
    "joindate": joindate,
    "name": name,
    "days": days,
    "person": person,
    "amount": amount,
    "rewardpoints": rewardpoints,
    "startdate": startdate,
    "gamename": gamename,
    "gamedays": gamedays,
    "gameperson": gameperson,
    "gameamount": gameamount,
    "gamerewardpoints": gamerewardpoints,
    "gamestartdate": gamestartdate,
    "categoryname": categoryname,
    "categorytime": categorytime,
    "categorytype": categorytype,
    "categorypoint": categorypoint,
    "categoryimage": categoryimage,
  };
}
