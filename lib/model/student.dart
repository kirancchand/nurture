import 'dart:convert';
class StudentResponseModel {
  final String statuscode;
  final HomeResponse response;
  final String message;

  StudentResponseModel({this.statuscode,this.response, this.message});

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) {
    // print(json["response"]["childrens"][0]["studentid"].runtimeType);
    return StudentResponseModel(
      statuscode: json["statuscode"],
      // response: List<HomeResponse>.from(json["response"].map((x) => HomeResponse.fromJson(x))),
      response: HomeResponse.fromJson(json["response"]),
      message: json["message"],
    );
  }
}

class HomeResponse {

  HomeResponse({
    this.parents,
    this.childrens,
  });
  List<ParentResponse> parents;
  List<StudentResponse> childrens;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(

    parents: List<ParentResponse>.from(json["parents"].map((x) => ParentResponse.fromJson(x))),
    childrens: List<StudentResponse>.from(json["childrens"].map((x) => StudentResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "parents": parents,
    "childrens": childrens,
  };
}


class StudentResponse {

  StudentResponse({
    this.studentid,
    this.studentname,
    this.studentnumber,
  });

  int studentid;
  String studentname;
  String studentnumber;


  factory StudentResponse.fromJson(Map<String, dynamic> json) => StudentResponse(
    studentid: json["studentid"] ,
    studentname: json["studentname"] ?? "",
    studentnumber: json["studentnumber"] ?? "",
  );

  String get civilid => null;

  Map<String, dynamic> toJson() => {
    "studentid": studentid,
    "studentname": studentname,
    "studentnumber": studentnumber,
  };
}

class ParentResponse {

  ParentResponse({
    this.name,
    this.civilid,
    this.mobilenumber,
    this.emailid,
  });

  String name;
  String civilid;
  String mobilenumber;
  String emailid;


  factory ParentResponse.fromJson(Map<String, dynamic> json) => ParentResponse(
    name:json["name"] ?? "",
    civilid: json["civilid"] ?? "",
    mobilenumber: json["mobilenumber"] ?? "",
    emailid: json["emailid"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name":name,
    "civilid": civilid,
    "mobilenumber": mobilenumber,
    "emailid": emailid,
  };
}


