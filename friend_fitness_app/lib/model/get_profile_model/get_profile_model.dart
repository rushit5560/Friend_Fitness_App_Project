// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    required this.kind,
    required this.users,
  });

  String kind;
  List<User> users;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    kind: json["kind"] ?? "",
    users: List<User>.from(json["users"].map((x) => User.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    required this.localId,
    required this.email,
    required this.passwordHash,
    required this.emailVerified,
    required this.passwordUpdatedAt,
    required this.providerUserInfo,
    required this.validSince,
    required this.lastLoginAt,
    required this.createdAt,
    required this.lastRefreshAt,
  });

  String localId;
  String email;
  String passwordHash;
  bool emailVerified;
  int passwordUpdatedAt;
  List<ProviderUserInfo> providerUserInfo;
  String validSince;
  String lastLoginAt;
  String createdAt;
  DateTime lastRefreshAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    localId: json["localId"] ?? "",
    email: json["email"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    emailVerified: json["emailVerified"] ?? false,
    passwordUpdatedAt: json["passwordUpdatedAt"],
    providerUserInfo: List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x))),
    validSince: json["validSince"] ?? "",
    lastLoginAt: json["lastLoginAt"] ?? "",
    createdAt: json["createdAt"] ?? "",
    lastRefreshAt: DateTime.parse(json["lastRefreshAt"] ?? DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "email": email,
    "passwordHash": passwordHash,
    "emailVerified": emailVerified,
    "passwordUpdatedAt": passwordUpdatedAt,
    "providerUserInfo": List<dynamic>.from(providerUserInfo.map((x) => x.toJson())),
    "validSince": validSince,
    "lastLoginAt": lastLoginAt,
    "createdAt": createdAt,
    "lastRefreshAt": lastRefreshAt.toIso8601String(),
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    required this.providerId,
    required this.federatedId,
    required this.email,
    required this.rawId,
  });

  String providerId;
  String federatedId;
  String email;
  String rawId;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"] ?? "",
    federatedId: json["federatedId"] ?? "",
    email: json["email"] ?? "",
    rawId: json["rawId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "federatedId": federatedId,
    "email": email,
    "rawId": rawId,
  };
}
