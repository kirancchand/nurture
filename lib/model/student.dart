import 'dart:convert';
class StudentResponseModel {
  final String statuscode;
  final List<StudentResponse> response;
  final String message;

  StudentResponseModel({this.statuscode,this.response, this.message});

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentResponseModel(
      statuscode: json["statuscode"],
      response: List<StudentResponse>.from(json["response"].map((x) => StudentResponse.fromJson(x))),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}


class StudentResponse {

  StudentResponse({
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

  factory StudentResponse.fromJson(Map<String, dynamic> json) => StudentResponse(
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

