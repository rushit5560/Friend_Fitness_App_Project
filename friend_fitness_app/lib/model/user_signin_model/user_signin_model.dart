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
    required this.profilePicture,
    required this.registered,
    required this.refreshToken,
    required this.expiresIn,
    //required this.error,
  });

  String kind;
  String localId;
  String email;
  String displayName;
  String idToken;
  bool registered;
  String profilePicture;
  String refreshToken;
  String expiresIn;
  //SignInErrorModelError error;

  factory UserSignInModel.fromJson(Map<String, dynamic> json) => UserSignInModel(
    kind: json["kind"] ?? "",
    localId: json["localId"] ?? "",
    email: json["email"] ?? "",
    displayName: json["displayName"] ?? "",
    idToken: json["idToken"] ?? "",
    registered: json["registered"] ?? false,
    profilePicture: json["profilePicture"],
    refreshToken: json["refreshToken"] ?? "",
    expiresIn: json["expiresIn"] ?? "",
   // error: SignInErrorModelError.fromJson(json["error"] ?? {})
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "idToken": idToken,
    "registered": registered,
    "profilePicture": profilePicture,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
    //"error": error.toJson()
  };
}

/*SignInErrorModel signInErrorModelFromJson(String str) => SignInErrorModel.fromJson(json.decode(str));

String signInErrorModelToJson(SignInErrorModel data) => json.encode(data.toJson());

class SignInErrorModel {
  SignInErrorModel({
    required this.error,
  });

  SignInErrorModelError error;

  factory SignInErrorModel.fromJson(Map<String, dynamic> json) => SignInErrorModel(
    error: SignInErrorModelError.fromJson(json["error"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "error": error.toJson(),
  };
}*/

class SignInErrorModelError {
  SignInErrorModelError({
    required this.code,
    required this.message,
    required this.errors,
  });

  int code;
  String message;
  List<ErrorElement> errors;

  factory SignInErrorModelError.fromJson(Map<String, dynamic> json) => SignInErrorModelError(
    code: json["code"] ?? 0,
    message: json["message"] ?? "",
    errors: List<ErrorElement>.from(json["errors"].map((x) => ErrorElement.fromJson(x)) ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
  };
}

class ErrorElement {
  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
  });

  String message;
  String domain;
  String reason;

  factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
    message: json["message"] ?? "",
    domain: json["domain"] ?? "",
    reason: json["reason"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "domain": domain,
    "reason": reason,
  };
}
