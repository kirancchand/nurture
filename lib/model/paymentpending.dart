import 'dart:convert';

class PaymentPendingResponseModel {
  final String statuscode;
  final PaymentPendingResponse response;
  final String message;

  PaymentPendingResponseModel({this.statuscode, this.response, this.message});

  factory PaymentPendingResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentPendingResponseModel(
      statuscode: json["statuscode"],
      response: json["statuscode"] != '200'
          ? PaymentPendingResponse()
          : PaymentPendingResponse.fromJson(json["response"]),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}

class PaymentPendingResponse {
  PaymentPendingResponse({
    this.paymentid,
    this.studentnumber,
    this.studentname,
    this.openingbalance,
    this.installment_1,
    this.installment_2,
    this.installment_3,
    this.duenow,
    this.absopeningbalance,
    this.row,
    this.arabstudentname,
    this.studentid,
    this.dueamount,
    this.academicyear,
    this.parentnumber,
  });

  int paymentid;
  String studentnumber;
  String studentname;
  double openingbalance;
  InstallmentResponse installment_1;
  InstallmentResponse installment_2;
  InstallmentResponse installment_3;
  double duenow;
  double absopeningbalance;
  int row;
  String arabstudentname;
  int studentid;
  double dueamount;
  String academicyear;
  String parentnumber;

  factory PaymentPendingResponse.fromJson(Map<String, dynamic> json) =>
      PaymentPendingResponse(
        paymentid: json["paymentid"] ?? "",
        studentnumber: json["studentnumber"] ?? "",
        studentname: json["studentname"] ?? "",
        openingbalance: json["openingbalance"] ?? "",
        installment_1: InstallmentResponse.fromJson(json["installment_1"]),
        installment_2: InstallmentResponse.fromJson(json["installment_2"]),
        installment_3: InstallmentResponse.fromJson(json["installment_3"]),
        duenow: json["duenow"] ?? "",
        absopeningbalance: json["absopeningbalance"] ?? "",
        row: json["row"] ?? "",
        arabstudentname: json["arabstudentname"] ?? "",
        studentid: json["studentid"] ?? "",
        dueamount: json["dueamount"] ?? "",
        academicyear: json["academicyear"] ?? "",
        parentnumber: json["parentnumber"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "paymentid": paymentid,
        "studentnumber": studentnumber,
        "studentname": studentname,
        "openingbalance": openingbalance,
        "installment_1": installment_1,
        "installment_2": installment_2,
        "installment_3": installment_3,
        "duenow": duenow,
        "absopeningbalance": absopeningbalance,
        "row": row,
        "arabstudentname": arabstudentname,
        "studentid": studentid,
        "dueamount": dueamount,
        "academicyear": academicyear,
        "parentnumber": parentnumber,
      };
}

class InstallmentResponse {
  InstallmentResponse(
      {this.tuitionfee, this.transportfee, this.enrollment, this.others});

  double tuitionfee;
  double transportfee;
  double enrollment;
  double others;

  factory InstallmentResponse.fromJson(Map<String, dynamic> json) =>
      InstallmentResponse(
        tuitionfee: json["tuitionfee"] ?? "",
        transportfee: json["transportfee"] ?? "",
        enrollment: json["enrollment"] ?? "",
        others: json["others"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "tuitionfee": tuitionfee,
        "transportfee": transportfee,
        "enrollment": enrollment,
        "others": others,
      };
}
