import 'dart:convert';

class NotificationResponseModel {
  final String statuscode;
  final List<NotificationResponse> response;
  final String message;

  NotificationResponseModel({this.statuscode, this.response, this.message});

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      statuscode: json["statuscode"],
      response: json["statuscode"] != "200"
          ? []
          : List<NotificationResponse>.from(
              json["response"].map((x) => NotificationResponse.fromJson(x))),
      // response: Response.fromJson(json["response"]),
      message: json["message"],
    );
  }
}

class NotificationResponse {
  NotificationResponse({
    this.readstatus,
    this.subject,
    this.message,
    this.notificationid,
    this.date,
    this.studentid,
  });

  bool readstatus;
  String subject;
  String message;
  int notificationid;
  String date;
  int studentid;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        readstatus: json["readstatus"] ?? "",
        subject: json["subject"] ?? "",
        message: json["message"] ?? "",
        notificationid: json["notificationid"] ?? "",
        date: json["date"] ?? null,
        studentid: json["studentid"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "readstatus": readstatus,
        "subject": subject,
        "message": message,
        "notificationid": notificationid,
        "date": date,
        "studentid": studentid,
      };
}
