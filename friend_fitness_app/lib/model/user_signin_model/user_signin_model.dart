import 'dart:convert';

UserSignInModel userSignInModelFromJson(String str) => UserSignInModel.fromJson(json.decode(str));

String userSignInModelToJson(UserSignInModel data) => json.encode(data.toJson());

class UserSignInModel {
  UserSignInModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
  });

  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String refreshToken;
  String expiresIn;

  factory UserSignInModel.fromJson(Map<String, dynamic> json) => UserSignInModel(
    kind: json["kind"],
    localId: json["localId"],
    email: json["email"],
    displayName: json["displayName"],
    idToken: json["idToken"],
    registered: json["registered"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "idToken": idToken,
    "registered": registered,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}