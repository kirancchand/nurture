import 'dart:convert';

class LoginResponseModel {
  final String statuscode;
  final LoginResponse response;
  final String message;

  LoginResponseModel({this.statuscode, this.response, this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statuscode: json["statuscode"],
      response: json["statuscode"]=="200"?LoginResponse.fromJson(json["response"]):null,
      message: json["message"],
    );
  }
}

class LoginResponse {
  LoginResponse({
    this.access_token,
    this.Username,
    this.token_type,
    this.expires_in,
    this.refresh_token,
    this.client_id,
    this.issued,
    this.expires,
    this.userrole,
  });

  String access_token;
  String Username;
  String token_type;
  String expires_in;
  String refresh_token;
  String client_id;
  String issued;
  String expires;
  String userrole;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        access_token: json["access_token"] ?? "",
        Username: json["username"] ?? "",
        token_type: json["token_type"] ?? "",
        expires_in: json["expires_in"] ?? "",
        refresh_token: json["refresh_token"] ?? "",
        client_id: json["client_id"] ?? "",
        issued: json["issued"] ?? "",
        expires: json["expires"] ?? "",
        userrole: json["userrole"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "Username": Username,
        "token_type": token_type,
        "expires_in": expires_in,
        "refresh_token": refresh_token,
        "client_id": client_id,
        "issued": issued,
        "expires": expires,
        "userrole": userrole,
      };
}

// class LoginResponseModel {
//   final String token;
//   final String error;
//
//   LoginResponseModel({this.token, this.error});
//
//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       token: json["token"] != null ? json["token"] : "",
//       error: json["error"] != null ? json["error"] : "",
//     );
//   }
// }

class LoginRequestModel {
  String Username;
  String Password;

  LoginRequestModel({
    this.Username,
    this.Password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Username': Username.trim(),
      'password': Password.trim(),
    };

    return map;
  }
}
