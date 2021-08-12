import 'dart:convert';

class FeeResponseModel {
  final String statuscode;
  final List<FeeResponse> response;
  final String message;

  FeeResponseModel({this.statuscode, this.response, this.message});

  factory FeeResponseModel.fromJson(Map<String, dynamic> json) {
    return FeeResponseModel(
      statuscode: json["statuscode"],
      response: List<FeeResponse>.from(
          json["response"].map((x) => FeeResponse.fromJson(x))),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}

class FeeResponse {
  FeeResponse(
      {this.studentid,
      this.studentnumber,
      this.studentname,
      this.passportnumber,
      this.civilid,
      this.dueamount,
      this.parentid,
      this.parentnumber,
      this.userid,
      this.parentname,
      this.arabparentname,
      this.arabstudentname,
      this.mothername,
      this.arabmothername,
      this.schoolid,
      this.schoolname,
      this.enrollmentamount
      // this.$id,
      });

  int studentid;
  String studentnumber;
  String studentname;
  String passportnumber;
  String civilid;
  double dueamount;
  int parentid;
  String parentnumber;
  int userid;
  String parentname;
  String arabparentname;
  String arabstudentname;
  String mothername;
  String arabmothername;
  int schoolid;
  String schoolname;
  double enrollmentamount;
  //String $id;

  factory FeeResponse.fromJson(Map<String, dynamic> json) => FeeResponse(
        studentid: json["studentid"] ?? "",
        studentnumber: json["studentnumber"] ?? "",
        studentname: json["studentname"] ?? "",
        passportnumber: json["passportnumber"] ?? "",
        civilid: json["civilid"] ?? "",
        dueamount: json["dueamount"] ?? "",
        parentid: json["parentid"] ?? "",
        parentnumber: json["parentnumber"] ?? "",
        userid: json["userid"] ?? "",
        parentname: json["parentname"] ?? "",
        arabparentname: json["arabparentname"] ?? "",
        arabstudentname: json["arabstudentname"] ?? "",
        mothername: json["mothername"] ?? "",
        arabmothername: json["arabmothername"] ?? "",
        schoolid: json["schoolid"] ?? "",
        schoolname: json["schoolname"] ?? "",
        enrollmentamount: json["enrollmentamount"],
        //  $id: json["$id"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "studentnumber": studentnumber,
        "studentname": studentname,
        "passportnumber": passportnumber,
        "civilid": civilid,
        "dueamount": dueamount,
        "parentid": parentid,
        "parentnumber": parentnumber,
        "userid": userid,
        "parentname": parentname,
        "arabparentname": arabparentname,
        "arabstudentname": arabstudentname,
        "mothername": mothername,
        "arabmothername": arabmothername,
        "schoolid": schoolid,
        "schoolname": schoolname,
        "enrollmentamount": enrollmentamount,
        //"$id": $id,
      };
}
