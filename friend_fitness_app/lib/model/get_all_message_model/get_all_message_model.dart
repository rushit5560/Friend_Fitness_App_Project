
/*import 'dart:convert';

GetAllMessageModel getAllGameListModelFromJson(String str) => GetAllMessageModel.fromJson(json.decode(str));

String getAllGameListModelToJson(GetAllMessageModel data) => json.encode(data.toJson());

class GetAllMessageModel {
  bool success;
  String messege;
  List<List1> list;
  String errorMessage;

  GetAllMessageModel({
    required this.success,
    required this.messege,
    required this.list,
    required this.errorMessage});


  GetAllMessageModel.fromJson(Map<String, dynamic> json) {
    success = json["success"] ?? false,
    messege = json["messege"] ?? "",
    list: List<List1>.from(json["list"].map((x) => List1.fromJson(x)) ?? {})
    *//*if (json['list'] != null) {
      list = <List1>[];
      json['list'].forEach((v) {
        list!.add(new List1.fromJson(v));
      });
    }*//*
    errorMessage = json['error'] ?? "";
  }

  *//*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['messege'] = this.messege;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    data['error'] = this.errorMessage;
    return data;
  }*//*
}

class List1 {
  int id;
  int userid;
  int gameid;
  String message;
  String createdAt;
  String file;
  String profile;

  List1(
      {
        required this.id,
        required this.userid,
        required this.gameid,
        required this.message,
        required this.createdAt,
        required this.file,
        required this.profile});

*//*  factory List1.fromJson(Map<String, dynamic> json) => List1 (
    id = json['id'];
    userid = json['userid'];
    gameid = json['gameid'];
    message = json['message'] ?? "";
    createdAt = json['created_at'];
    file = json['file'];
    profile = json['profile'];
  );*//*

  factory List1.fromJson(Map<String, dynamic> json) => List1(
      id = json['id'];
      userid = json['userid'];
      gameid = json['gameid'];
  message = json['message'] ?? "";
      createdAt = json['created_at'];
      file = json['file'];
  profile = json['profile'];
  );

  Map<String, dynamic> toJson() => {
    //final Map<String, dynamic> data = new Map<String, dynamic>();
    "id" = id;
    "userid" = userid;
    'gameid' = gameid;
    'message' = message;
    'created_at' = createdAt;
    'file' = file;
   'profile' = profile;
    //return data;
  };
}*/

import 'dart:convert';

GetAllMessageModel getAllGameListModelFromJson(String str) => GetAllMessageModel.fromJson(json.decode(str));

String getAllMessageModelToJson(GetAllMessageModel data) => json.encode(data.toJson());

class GetAllMessageModel {
  GetAllMessageModel({
    required this.success,
    required this.messege,
    required this.list,
    required this.errorMessage
  });

  bool success;
  String messege;
  List<List1> list;
  String errorMessage;

  factory GetAllMessageModel.fromJson(Map<String, dynamic> json) => GetAllMessageModel(
    success: json["success"] ?? false,
    messege: json["messege"] ?? "",
    list: List<List1>.from(json["list"].map((x) => List1.fromJson(x)) ?? {}),
    errorMessage: json["error"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "messege": messege,
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
    "error" : errorMessage,
  };
}

class List1 {
  List1({
    required this.id,
    required this.userid,
    required this.gameid,
    required this.message,
    required this.createdAt,
    required this.file,
    required this.profile,
  });

  int id;
  int userid;
  int gameid;
  String message;
  String createdAt;
  String file;
  String profile;

  factory List1.fromJson(Map<String, dynamic> json) => List1(
    id: json["id"] ?? 0,
    userid: json["userid"] ?? 0,
    gameid: json["gameid"] ?? 0,
    message: json["message"] ?? "",
    createdAt: json["createdAt"] ?? "",
    file: json["file"] ?? "",
    profile: json["profile"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userid": userid,
    "gameid": gameid,
    "message": message,
    "createdAt": createdAt,
    "file": file,
    "profile": profile
  };
}

