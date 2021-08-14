// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    this.id,
    this.statuscode,
    this.response,
    this.message,
  });

  String id;
  String statuscode;
  String response;
  String message;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["\u0024id"],
        statuscode: json["statuscode"],
        response: json["response"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "statuscode": statuscode,
        "response": response,
        "message": message,
      };
}
