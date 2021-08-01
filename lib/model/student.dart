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
    this.sfirstname,
    this.studentnumber,
  });

  int studentid;
  String sfirstname;
  String studentnumber;


  factory StudentResponse.fromJson(Map<String, dynamic> json) => StudentResponse(
    studentid: json["studentid"] ?? "",
    sfirstname: json["sfirstname"] ?? "",
    studentnumber: json["studentnumber"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "studentid": studentid,
    "sfirstname": sfirstname,
    "studentnumber": studentnumber,
  };
}

