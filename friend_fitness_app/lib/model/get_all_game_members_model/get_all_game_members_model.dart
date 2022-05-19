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

  int id;
  int gameid;
  int userid;
  String categoryid;
  int point;
  String joindate;
  String name;
  int days;
  int person;
  int amount;
  int rewardpoints;
  String startdate;
  String gamename;
  int gamedays;
  int gameperson;
  int gameamount;
  int gamerewardpoints;
  String gamestartdate;
  String categoryname;
  String categorytime;
  String categorytype;
  String categorypoint;
  String categoryimage;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? 0,
    gameid: json["gameid"] ?? 0,
    userid: json["userid"] ?? 0,
    categoryid: json["categoryid"] ?? "",
    point: json["point"] ?? 0,
    joindate: json["joindate"] ?? "",
    name: json["name"] ?? "",
    days: json["days"] ?? 0,
    person: json["person"] ?? 0,
    amount: json["amount"] ?? 0,
    rewardpoints: json["rewardpoints"] ?? 0,
    startdate: json["startdate"] ?? "",
    gamename: json["gamename"] ?? "",
    gamedays: json["gamedays"] ?? 0,
    gameperson: json["gameperson"] ?? 0,
    gameamount: json["gameamount"] ?? 0,
    gamerewardpoints: json["gamerewardpoints"] ?? 0,
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
