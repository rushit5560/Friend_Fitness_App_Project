// To parse this JSON data, do
//
//     final getUserWisePointModel = getUserWisePointModelFromJson(jsonString);

import 'dart:convert';

GetUserWisePointModel getUserWisePointModelFromJson(String str) => GetUserWisePointModel.fromJson(json.decode(str));

String getUserWisePointModelToJson(GetUserWisePointModel data) => json.encode(data.toJson());

class GetUserWisePointModel {
  GetUserWisePointModel({
    required this.the0,
    required this.success,
    required this.messege,
    required this.list,
  });

  int the0;
  bool success;
  String messege;
  List<ListElement> list;

  factory GetUserWisePointModel.fromJson(Map<String, dynamic> json) => GetUserWisePointModel(
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
    required this.userid,
    required this.gameid,
    required this.categoryid,
    required this.point,
    required this.date,
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
  int userid;
  int gameid;
  int categoryid;
  int point;
  String date;
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
  double categorytime;
  String categorytype;
  int categorypoint;
  String categoryimage;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"] ?? 0,
    userid: json["userid"] ?? 0,
    gameid: json["gameid"] ?? 0,
    categoryid: json["categoryid"] ?? 0,
    point: json["point"] ?? 0,
    date: json["date"] ?? "",
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
    categorytime: json["categorytime"].toDouble(),
    categorytype: json["categorytype"] ?? "",
    categorypoint: json["categorypoint"] ?? 0,
    categoryimage: json["categoryimage"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "gameid": gameid,
    "categoryid": categoryid,
    "point": point,
    "date": date,
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
