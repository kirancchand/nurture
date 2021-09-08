// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

FeeStructureModel feeStructureFromJson(String str) => FeeStructureModel.fromJson(json.decode(str));

String feeStructureToJson(FeeStructureModel data) => json.encode(data.toJson());

class FeeStructureModel {
  FeeStructureModel({
    this.id,
    this.statuscode,
    this.response,
    this.message,
  });

  String id;
  String statuscode;
  List<Response> response;
  String message;

  factory FeeStructureModel.fromJson(Map<String, dynamic> json) => FeeStructureModel(
    id: json["\u0024id"],
    statuscode: json["statuscode"],
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "statuscode": statuscode,
    "response": List<dynamic>.from(response.map((x) => x.toJson())),
    "message": message,
  };
}

class Response {
  Response({
    this.id,
    this.duenow,
    this.absopeningbalance,
    this.row,
    this.paymentid,
    this.studentnumber,
    this.studentname,
    this.arabstudentname,
    this.openingbalance,
    this.studentid,
    this.dueamount,
    this.academicyear,
    this.academicyearid,
    this.parentnumber,
    this.installment,
    this.parentid,
    this.totaldue
  });

  String id;
  double duenow;
  double absopeningbalance;
  int row;
  int paymentid;
  String studentnumber;
  String studentname;
  String arabstudentname;
  double openingbalance;
  int studentid;
  double dueamount;
  String academicyear;
  String academicyearid;
  String parentnumber;
  List<InstallmentResponse> installment;
  int parentid;
  double totaldue;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    id: json["\u0024id"],
    duenow: json["duenow"],
    absopeningbalance: json["absopeningbalance"],
    row: json["row"],
    paymentid: json["paymentid"],
    studentnumber: json["studentnumber"],
    studentname: json["studentname"],
    arabstudentname: json["arabstudentname"],
    openingbalance: json["openingbalance"],
    studentid: json["studentid"],
    dueamount: json["dueamount"],
    academicyear: json["academicyear"],
    academicyearid: json["academicyearid"],
    parentnumber: json["parentnumber"],
    installment: List<InstallmentResponse>.from(json["installment"].map((x) => InstallmentResponse.fromJson(x))),
    parentid: json["parentid"],
    totaldue: json["totaldue"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "duenow": duenow,
    "absopeningbalance": absopeningbalance,
    "row": row,
    "paymentid": paymentid,
    "studentnumber": studentnumber,
    "studentname": studentname,
    "arabstudentname": arabstudentname,
    "openingbalance": openingbalance,
    "studentid": studentid,
    "dueamount": dueamount,
    "academicyear": academicyear,
    "academicyearid": academicyearid,
    "parentnumber": parentnumber,
    "installment": List<dynamic>.from(installment.map((x) => x.toJson())),
    "parentid": parentid,
    "totaldue": totaldue,
  };
}

class InstallmentResponse {
  InstallmentResponse({
    this.id,
    this.tuitionfee,
    this.transportfee,
    this.enrollment,
    this.others,
  });

  String id;
  double tuitionfee;
  double transportfee;
  double enrollment;
  double others;

  factory InstallmentResponse.fromJson(Map<String, dynamic> json) => InstallmentResponse(
    id: json["\u0024id"],
    tuitionfee: json["tuitionfee"],
    transportfee: json["transportfee"],
    enrollment: json["enrollment"],
    others: json["others"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "tuitionfee": tuitionfee,
    "transportfee": transportfee,
    "enrollment": enrollment,
    "others": others,
  };
}
