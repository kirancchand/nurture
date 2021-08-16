class StudentContactResponseModel {
  final String statuscode;
  final StudentContactResponse response;
  final String message;

  StudentContactResponseModel({this.statuscode,this.response, this.message});

  factory StudentContactResponseModel.fromJson(Map<String, dynamic> json) {
    return StudentContactResponseModel(
      statuscode: json["statuscode"],
      response: null,
      message: json["message"],
    );
  }
}


class StudentContactResponse {
  StudentContactResponse({
    this.access_token,
    this.Username,
  });

  String access_token;
  String Username;

  factory StudentContactResponse.fromJson(Map<String, dynamic> json) => StudentContactResponse(
    access_token: json["access_token"] ?? "",
    Username: json["username"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "access_token": access_token,
    "Username": Username,
  };
}

class StudentContactRequestModel {
  int studentid;
  String studentname;
  String studentemail;
  String studentphonenumber;
  String studentinquiry;

  StudentContactRequestModel({
    this.studentid,
    this.studentname,
    this.studentemail,
    this.studentphonenumber,
    this.studentinquiry,
  });



  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'studentid': studentid,
      'studentname': studentname.trim(),
      'studentemail': studentemail.trim(),
      'studentphonenumber': studentphonenumber.trim(),
      'studentinquiry': studentinquiry.trim(),
    };
    return map;
  }
}

