import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.statuscode,
    this.response,
    this.message,
  });


  String statuscode;
  String response;
  String message;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    statuscode: json["statuscode"],
    response: json["response"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statuscode": statuscode,
    "response": response,
    "message": message,
  };
}
