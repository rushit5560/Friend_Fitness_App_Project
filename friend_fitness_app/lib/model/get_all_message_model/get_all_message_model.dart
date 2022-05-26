class GetAllMessageModel {
  bool? success;
  String? messege;
  List<List1>? list;

  GetAllMessageModel({this.success, this.messege, this.list});

  GetAllMessageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    messege = json['messege'];
    if (json['list'] != null) {
      list = <List1>[];
      json['list'].forEach((v) {
        list!.add(new List1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['messege'] = this.messege;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class List1 {
  int? id;
  int? userid;
  int? gameid;
  String? message;
  String? createdAt;
  String? file;

  List1(
      {this.id,
        this.userid,
        this.gameid,
        this.message,
        this.createdAt,
        this.file});

  List1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    gameid = json['gameid'];
    message = json['message'];
    createdAt = json['created_at'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userid'] = this.userid;
    data['gameid'] = this.gameid;
    data['message'] = this.message;
    data['created_at'] = this.createdAt;
    data['file'] = this.file;
    return data;
  }
}
