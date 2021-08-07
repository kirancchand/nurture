abstract class StudentContactResponse {
  StudentContactResponse({
    this.studentname,
    this.studentemail,
    this.studentphonenumber,
    this.studentissuesubject,
    this.studentinquiry,
  });

  String studentname;
  String studentemail;
  String studentphonenumber;
  String studentissuesubject;
  String studentinquiry;

/*
  factory StudentResponse.fromJson(Map<String, dynamic> json) => StudentResponse(
   
    studentname: json["studentname"] ?? "",
    studentemail: json["studentemail"] ?? "",
  );
*/

  Map<String, dynamic> toJson() => {
        "studentname": studentname,
        "studentemail": studentemail,
        "studentphonenumber": studentphonenumber,
        "studentissuesubject": studentissuesubject,
        "studentinquiry": studentinquiry,
      };
}

class ParentContactResponse {
  ParentContactResponse({
    this.parentname,
    this.parentemail,
    this.parentphonenumber,
    this.parentissuesubject,
    this.parentinquiry,
  });

  String parentname;
  String parentemail;
  String parentphonenumber;
  String parentissuesubject;
  String parentinquiry;

 /* factory ParentResponse.fromJson(Map<String, dynamic> json) => ParentResponse(
       parentname: json["parentname"] ?? "",
        parentdetailsid: json["parentdetailsid"] ?? "",
        civilid: json["civilid"] ?? "",
        mobilenumber: json["mobilenumber"] ?? "",
        emailid: json["emailid"] ?? "",
      );*/

  Map<String, dynamic> toJson() => {
        "parentname": parentname,
        "parentemail": parentemail,
        "parentphonenumber": parentphonenumber,
        "parentissuesubject": parentissuesubject,
        "parentinquiry":parentinquiry,
      };
}
