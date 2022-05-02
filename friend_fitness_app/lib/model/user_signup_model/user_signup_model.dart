import 'dart:convert';

UserSignUpModel userSignUpModelFromJson(String str) => UserSignUpModel.fromJson(json.decode(str));

String userSignUpModelToJson(UserSignUpModel data) => json.encode(data.toJson());

class UserSignUpModel {
  UserSignUpModel({
    required this.kind,
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  String kind;
  String idToken;
  String email;
  String refreshToken;
  String expiresIn;
  String localId;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) => UserSignUpModel(
    kind: json["kind"] ?? "",
    idToken: json["idToken"] ?? "",
    email: json["email"] ?? "",
    refreshToken: json["refreshToken"] ?? "",
    expiresIn: json["expiresIn"] ?? "",
    localId: json["localId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "idToken": idToken,
    "email": email,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    "localId": localId,
  };
}
