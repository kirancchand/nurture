// import 'dart:convert';
//
// class FeeResponseModel {
//   final String statuscode;
//   final List<FeeResponse> response;
//   final String message;
//
//   FeeResponseModel({this.statuscode, this.response, this.message});
//
//   factory FeeResponseModel.fromJson(Map<String, dynamic> json) {
//     return FeeResponseModel(
//       statuscode: json["statuscode"],
//       response: List<FeeResponse>.from(
//           json["response"].map((x) => FeeResponse.fromJson(x))),
//       // response: Response.fromJson(json["response"]),
//       message: json["message"],
//     );
//   }
// }
//
// class FeeResponse {
//   FeeResponse(
//       {this.studentid,
//       this.studentnumber,
//       this.studentname,
//       this.passportnumber,
//       this.civilid,
//       this.dueamount,
//       this.parentid,
//       this.parentnumber,
//       this.userid,
//       this.parentname,
//       this.arabparentname,
//       this.arabstudentname,
//       this.mothername,
//       this.arabmothername,
//       this.schoolid,
//       this.schoolname,
//       this.enrollmentamount
//       // this.$id,
//       });
//
//   int studentid;
//   String studentnumber;
//   String studentname;
//   String passportnumber;
//   String civilid;
//   double dueamount;
//   int parentid;
//   String parentnumber;
//   int userid;
//   String parentname;
//   String arabparentname;
//   String arabstudentname;
//   String mothername;
//   String arabmothername;
//   int schoolid;
//   String schoolname;
//   double enrollmentamount;
//   //String $id;
//
//   factory FeeResponse.fromJson(Map<String, dynamic> json) => FeeResponse(
//         studentid: json["studentid"] ?? "",
//         studentnumber: json["studentnumber"] ?? "",
//         studentname: json["studentname"] ?? "",
//         passportnumber: json["passportnumber"] ?? "",
//         civilid: json["civilid"] ?? "",
//         dueamount: json["dueamount"] ?? "",
//         parentid: json["parentid"] ?? "",
//         parentnumber: json["parentnumber"] ?? "",
//         userid: json["userid"] ?? "",
//         parentname: json["parentname"] ?? "",
//         arabparentname: json["arabparentname"] ?? "",
//         arabstudentname: json["arabstudentname"] ?? "",
//         mothername: json["mothername"] ?? "",
//         arabmothername: json["arabmothername"] ?? "",
//         schoolid: json["schoolid"] ?? "",
//         schoolname: json["schoolname"] ?? "",
//         enrollmentamount: json["enrollmentamount"],
//         //  $id: json["$id"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "studentid": studentid,
//         "studentnumber": studentnumber,
//         "studentname": studentname,
//         "passportnumber": passportnumber,
//         "civilid": civilid,
//         "dueamount": dueamount,
//         "parentid": parentid,
//         "parentnumber": parentnumber,
//         "userid": userid,
//         "parentname": parentname,
//         "arabparentname": arabparentname,
//         "arabstudentname": arabstudentname,
//         "mothername": mothername,
//         "arabmothername": arabmothername,
//         "schoolid": schoolid,
//         "schoolname": schoolname,
//         "enrollmentamount": enrollmentamount,
//         //"$id": $id,
//       };
// }


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FeeResponseModel feeResponseFromJson(String str) => FeeResponseModel.fromJson(json.decode(str));

String feeResponseToJson(FeeResponseModel data) => json.encode(data.toJson());

class FeeResponseModel {
  FeeResponseModel({
    this.id,
    this.statuscode,
    this.response,
    this.message,
  });

  String id;
  String statuscode;
  Response response;
  String message;

  factory FeeResponseModel.fromJson(Map<String, dynamic> json) => FeeResponseModel(
    id: json["\u0024id"],
    statuscode: json["statuscode"],
    response: Response.fromJson(json["response"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "statuscode": statuscode,
    "response": response.toJson(),
    "message": message,
  };
}

class Response {
  Response({
    this.id,
    this.parentid,
    this.parentnumber,
    this.userid,
    this.parentname,
    this.arabparentname,
    this.academicyearid,
    this.academicyear,
    this.children,
  });

  String id;
  int parentid;
  String parentnumber;
  int userid;
  String parentname;
  String arabparentname;
  String academicyearid;
  String academicyear;
  List<FeeResponse> children;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["\u0024id"],
    parentid: json["parentid"]??"",
    parentnumber: json["parentnumber"]??"",
    userid: json["userid"]??"",
    parentname: json["parentname"]??"",
    arabparentname: json["arabparentname"]??"",
    academicyearid: json["academicyearid"]??"",
    academicyear: json["academicyear"]??"",
    children: List<FeeResponse>.from(json["children"].map((x) => FeeResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "parentid": parentid,
    "parentnumber": parentnumber,
    "userid": userid,
    "parentname": parentname,
    "arabparentname": arabparentname,
    "academicyearid": academicyearid,
    "academicyear": academicyear,
    "children": List<dynamic>.from(children.map((x) => x.toJson())),
  };
}

class FeeResponse {
  FeeResponse({
    this.id,
    this.studentid,
    this.studentnumber,
    this.studentname,
    this.arabstudentname,
    this.passportnumber,
    this.civilid,
    this.schoolname,
    this.dueamount,
    this.openingbalance,
    this.isincludeenrollment,
    this.enrollmentamount,
  });

  String id;
  int studentid;
  String studentnumber;
  String studentname;
  String arabstudentname;
  String passportnumber;
  String civilid;
  String schoolname;
  double dueamount;
  double openingbalance;
  int isincludeenrollment;
  double enrollmentamount;


  factory FeeResponse.fromJson(Map<String, dynamic> json) => FeeResponse(
    id: json["\u0024id"],
    studentid: json["studentid"]??"",
    studentnumber: json["studentnumber"]??"",
    studentname: json["studentname"]??"",
    arabstudentname: json["arabstudentname"]??"",
    passportnumber: json["passportnumber"]??"",
    civilid: json["civilid"]??"",
    schoolname: json["schoolname"]??"",
    dueamount: json["dueamount"]??0.0,
    openingbalance: json["openingbalance"]??0.0,
    isincludeenrollment: json["isincludeenrollment"]??0,
    enrollmentamount: json["enrollmentamount"]??0.0,
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "studentid": studentid,
    "studentnumber": studentnumber,
    "studentname": studentname,
    "arabstudentname": arabstudentname,
    "passportnumber": passportnumber,
    "civilid": civilid,
    "schoolname": schoolname,
    "dueamount": dueamount,
    "openingbalance": openingbalance,
    "isincludeenrollment": isincludeenrollment,
    "enrollmentamount": enrollmentamount,
  };
}
