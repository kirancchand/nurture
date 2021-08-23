import 'dart:convert';
class PaymentHistoryResponseModel {
  final String statuscode;
  final List<PaymentHistoryResponse> response;
  final String message;

  PaymentHistoryResponseModel({this.statuscode,this.response, this.message});

  factory PaymentHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentHistoryResponseModel(
      statuscode: json["statuscode"],
      response: List<PaymentHistoryResponse>.from(json["response"].map((x) => PaymentHistoryResponse.fromJson(x))),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}


class PaymentHistoryResponse {

  PaymentHistoryResponse({
    this.paymentid,
    this.amount,
    this.knettransactionid,
    this.filepath,
    this.transactionid,
    this.result,
    this.postdate,
    this.paytypename
  });

  String paymentid;
  double amount;
  String knettransactionid;
  String filepath;
  int transactionid;
  String result;
  String postdate;
  String paytypename;



  factory PaymentHistoryResponse.fromJson(Map<String, dynamic> json) => PaymentHistoryResponse(
    paymentid: json["paymentid"] ?? "",
    amount: json["amount"] ?? "",
    knettransactionid: json["knettransactionid"] ?? "",
    filepath: json["filepath"] ?? null,
    transactionid: json["transactionid"] ?? null,
    result: json["result"] ?? "",
    postdate: json["postdate"] ?? "",
    paytypename: json["paytypename"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "paymentid": paymentid,
    "amount": amount,
    "knettransactionid": knettransactionid,
    "filepath": filepath,
    "transactionid": transactionid,
    "result": result,
    "postdate": postdate,
    "paytypename": paytypename,
  };
}