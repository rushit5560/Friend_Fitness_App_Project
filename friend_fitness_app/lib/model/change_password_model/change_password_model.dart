// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
  ChangePasswordModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.displayName,
    required this.idToken,
    required this.providerUserInfo,
    required this.photoUrl,
    required this.refreshToken,
    required this.expiresIn,
    required this.passwordHash,
    required this.emailVerified,
  });

  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  List<ProviderUserInfo> providerUserInfo;
  String photoUrl;
  String refreshToken;
  String expiresIn;
  String passwordHash;
  bool emailVerified;

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
    kind: json["kind"] ?? "",
    localId: json["localId"] ?? "",
    email: json["email"] ?? "",
    displayName: json["displayName"] ?? "",
    idToken: json["idToken"] ?? "",
    providerUserInfo: List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x))),
    photoUrl: json["photoUrl"] ?? "",
    refreshToken: json["refreshToken"] ?? "",
    expiresIn: json["expiresIn"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    emailVerified: json["emailVerified"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "idToken": idToken,
    "providerUserInfo": List<dynamic>.from(providerUserInfo.map((x) => x.toJson())),
    "photoUrl": photoUrl,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    "passwordHash": passwordHash,
    "emailVerified": emailVerified,
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    required this.providerId,
    required this.displayName,
    required this.photoUrl,
    required this.federatedId,
    required this.email,
    required this.rawId,
  });

  String providerId;
  String displayName;
  String photoUrl;
  String federatedId;
  String email;
  String rawId;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"] ?? "",
    displayName: json["displayName"] ?? "",
    photoUrl: json["photoUrl"] ?? "",
    federatedId: json["federatedId"] ?? "",
    email: json["email"] ?? "",
    rawId: json["rawId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "displayName": displayName,
    "photoUrl": photoUrl,
    "federatedId": federatedId,
    "email": email,
    "rawId": rawId,
  };
}
