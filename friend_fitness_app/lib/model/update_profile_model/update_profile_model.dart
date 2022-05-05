// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModelToJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    required this.kind,
    required this.localId,
    required this.email,
    required this.providerUserInfo,
    required this.photoUrl,
    required this.passwordHash,
    required this.emailVerified,
  });

  String kind;
  String localId;
  String email;
  List<ProviderUserInfo> providerUserInfo;
  String photoUrl;
  String passwordHash;
  bool emailVerified;

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
    kind: json["kind"] ?? "",
    localId: json["localId"] ?? "",
    email: json["email"] ?? "",
    providerUserInfo: List<ProviderUserInfo>.from(json["providerUserInfo"].map((x) => ProviderUserInfo.fromJson(x)) ?? {}),
    photoUrl: json["photoUrl"] ?? "",
    passwordHash: json["passwordHash"] ?? "",
    emailVerified: json["emailVerified"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "localId": localId,
    "email": email,
    "providerUserInfo": List<dynamic>.from(providerUserInfo.map((x) => x.toJson())),
    "photoUrl": photoUrl,
    "passwordHash": passwordHash,
    "emailVerified": emailVerified,
  };
}

class ProviderUserInfo {
  ProviderUserInfo({
    required this.providerId,
    required this.photoUrl,
    required this.federatedId,
    required this.email,
    required this.rawId,
  });

  String providerId;
  String photoUrl;
  String federatedId;
  String email;
  String rawId;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
    providerId: json["providerId"] ?? "",
    photoUrl: json["photoUrl"] ?? "",
    federatedId: json["federatedId"] ?? "",
    email: json["email"] ?? "",
    rawId: json["rawId"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "photoUrl": photoUrl,
    "federatedId": federatedId,
    "email": email,
    "rawId": rawId,
  };
}
