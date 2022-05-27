// To parse this JSON data, do
//
//     final getUserWisePointModel = getUserWisePointModelFromJson(jsonString);

import 'dart:convert';

GetUserWisePointModel getUserWisePointModelFromJson(String str) => GetUserWisePointModel.fromJson(json.decode(str));

String getUserWisePointModelToJson(GetUserWisePointModel data) => json.encode(data.toJson());

class GetUserWisePointModel {
  GetUserWisePointModel({
    required this.success,
    required this.messege,
    required this.list,
    required this.date,
    required this.errorMessage
  });

  bool success;
  String messege;
  GetUserWisePointModelList list;
  String date;
  String errorMessage;

  factory GetUserWisePointModel.fromJson(Map<String, dynamic> json) => GetUserWisePointModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: GetUserWisePointModelList.fromJson(json["list"] ?? {}),
    date: json["Date"],
    errorMessage: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "list": list.toJson(),
    "Date": date,
    "error" : errorMessage,
  };
}

class GetUserWisePointModelList {
  GetUserWisePointModelList({
    required this.negative,
    required this.positive,
  });

  Tive negative;
  Tive positive;

  factory GetUserWisePointModelList.fromJson(Map<String, dynamic> json) => GetUserWisePointModelList(
    negative: Tive.fromJson(json["negative"] ?? {}),
    positive: Tive.fromJson(json["positive"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "negative": negative.toJson(),
    "positive": positive.toJson(),
  };
}

class Tive {
  Tive({
    required this.list,
    required this.total,
  });

  List<ListElement> list;
  int total;

  factory Tive.fromJson(Map<String, dynamic> json) => Tive(
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x)) ?? {}),
    total: json["total"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "total": total,
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
  int categorytime;
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
    gamestartdate: json["gamestartdate"] ??"",
    categoryname: json["categoryname"] ?? "",
    categorytime: json["categorytime"] ?? 0,
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
