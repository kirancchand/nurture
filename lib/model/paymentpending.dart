import 'dart:convert';
class PaymentPendingResponseModel {
  final String statuscode;
  final List<PaymentPendingResponse> response;
  final String message;
  

  PaymentPendingResponseModel({this.statuscode,this.response, this.message});

  factory PaymentPendingResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentPendingResponseModel(
      statuscode: json["statuscode"],
      response: List<PaymentPendingResponse>.from(json["response"].map((x) => PaymentPendingResponse.fromJson(x))),
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
    this.feetypeid,
    this.studentid,
    this.dueamount,
    this.academicyear,
    this.parentnumber,
    this.feetypename,
     
  });




  int paymentid;
  String studentnumber;
  String studentname;
  double openingbalance;
  double installment_1;
  double installment_2;
  double installment_3;
  double duenow;
  double absopeningbalance;
  int row;
  String arabstudentname;
  int feetypeid;
  int studentid;
  double dueamount;
  String academicyear;
  String parentnumber;
  String feetypename;
 



  factory PaymentPendingResponse.fromJson(Map<String, dynamic> json) => PaymentPendingResponse(
    paymentid: json["paymentid"] ?? "",
    studentnumber: json["studentnumber"] ?? "",
    studentname: json["studentname"] ?? "",
    openingbalance: json["openingbalance"] ?? "",
    installment_1: json["installment_1"] ?? null,
    installment_2: json["installment_2"] ?? "",
    installment_3: json["installment_3"] ?? "",
    duenow: json["duenow"] ?? "",
    absopeningbalance: json["absopeningbalance"] ?? "",
    row: json["row"] ?? "",
    arabstudentname: json["arabstudentname"] ?? "",
    feetypeid: json["feetypeid"] ?? "",
    studentid: json["studentid"] ?? "",
    dueamount: json["dueamount"] ?? "",
    academicyear: json["academicyear"] ?? "",
    parentnumber: json["parentnumber"] ?? "",
    feetypename: json["feetypename"] ?? "",
   
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
    "feetypeid": feetypeid,
    "studentid": studentid,
    "dueamount": dueamount,
    "academicyear": academicyear,
    "parentnumber": parentnumber,
    "feetypename": feetypename,
    
  };
}