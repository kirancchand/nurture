import 'dart:convert';
class LoginResponseModel {
  final String statuscode;
  final LoginResponse response;
  final String message;

  LoginResponseModel({this.statuscode,this.response, this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statuscode: json["statuscode"],
      response: LoginResponse.fromJson(json["response"]),
      message: json["message"],
    );
  }
}


class LoginResponse {
  LoginResponse({
    this.access_token,
    this.Username,
  });

  String access_token;
  String Username;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    access_token: json["access_token"] ?? "",
    Username: json["username"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "Username": Username,
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