import 'dart:convert';
class LoginResponseModel {
  final String statuscode;
  final Response response;
  final String message;

  LoginResponseModel({this.statuscode,this.response, this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      statuscode: json["statuscode"],
      response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}


class Response {
  Response({
    this.access_token,
    this.username,
  });

  String access_token;
  String username;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    access_token: json["access_token"] ?? "",
    username: json["username"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "username": username,
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
  String email;
  String password;

  LoginRequestModel({
     this.email,
     this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}