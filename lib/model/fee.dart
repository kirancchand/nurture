import 'dart:convert';
class FeeResponseModel {
  final String statuscode;
  final List<FeeResponse> response;
  final String message;

  FeeResponseModel({this.statuscode,this.response, this.message});

  factory FeeResponseModel.fromJson(Map<String, dynamic> json) {
    return FeeResponseModel(
      statuscode: json["statuscode"],
      response: List<FeeResponse>.from(json["response"].map((x) => FeeResponse.fromJson(x))),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}


class FeeResponse {

  FeeResponse({
    this.studentid,
    this.studentnumber,
    this.studentname,
    this.passportnumber,
    this.civilid,
    this.dueamount,
  });

  int studentid;
  String studentnumber;
  String studentname;
  String passportnumber;
  String civilid;
  double dueamount;

  factory FeeResponse.fromJson(Map<String, dynamic> json) => FeeResponse(
    studentid: json["studentid"] ?? "",
    studentnumber: json["studentnumber"] ?? "",
    studentname: json["studentname"] ?? "",
    passportnumber: json["passportnumber"] ?? "",
    civilid: json["civilid"] ?? "",
    dueamount: json["dueamount"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "studentid": studentid,
    "studentnumber": studentnumber,
    "studentname": studentname,
    "passportnumber": passportnumber,
    "civilid": civilid,
    "dueamount": dueamount,
  };
}