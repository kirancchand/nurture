class StudentResponseModel {
  final String statuscode;
  final HomeResponse response;
  final String message;

  StudentResponseModel({this.statuscode, this.response, this.message});

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) {
    // print(json["response"]["childrens"][0]["studentid"].runtimeType);
    return StudentResponseModel(
      statuscode: json["statuscode"],
      // response: List<HomeResponse>.from(json["response"].map((x) => HomeResponse.fromJson(x))),
      response: HomeResponse.fromJson(json["response"]),
      message: json["message"],
    );
  }
}

class HomeResponse {
  HomeResponse({
    this.parents,
    this.childrens,
  });
  List<ParentResponse> parents;
  List<StudentResponse> childrens;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        parents: List<ParentResponse>.from(
            json["parents"].map((x) => ParentResponse.fromJson(x))),
        childrens: List<StudentResponse>.from(
            json["childrens"].map((x) => StudentResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "parents": parents,
        "childrens": childrens,
      };
}

class StudentResponse {
  StudentResponse(
      {this.studentid,
      this.studentname,
      this.studentnumber,
      this.userid,
      this.birthdate,
      this.isguardian,
      this.gender,
      this.contactphonenumber,
      this.contactmobilenumber,
      this.contactemailid,
      //this.createdby,
      this.civilid,
      this.countryid,
      this.passportnumber,
      this.addressline1,
      this.addressline2,
      this.regionalarea,
      this.gradeid,
      this.schoolid,
      this.isfather,
      this.ismother,
      this.issameforaddress,
      this.arabstudentname,
      this.isprimarycontact,
      this.uniformfee,
      this.religion,
      this.studntcode,
      this.grade,
      this.schoolname,
      this.academicyear,
      this.nationality,
      this.studentcivilexpirydate});

  int studentid;
  String studentname;
  String studentnumber;
  int userid;
  DateTime birthdate;
  bool isguardian;
  String gender;
  String contactphonenumber;
  String contactmobilenumber;
  String contactemailid;
  // int createdby;
  String civilid;
  int countryid;
  String passportnumber;
  String addressline1;
  String addressline2;
  String regionalarea;
  int gradeid;
  int schoolid;
  String isfather;
  String ismother;
  bool issameforaddress;
  String arabstudentname;
  String isprimarycontact;
  double uniformfee;
  String religion;
  String studntcode;
  String grade;
  String schoolname;
  String academicyear;
  String nationality;
  DateTime studentcivilexpirydate;

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      StudentResponse(
        studentid: json["studentid"],
        studentname: json["studentname"] ?? "",
        studentnumber: json["studentnumber"] ?? "",
        userid: json["userid"] ?? null,
        birthdate: DateTime.parse(json["birthdate"]) ?? "",
        isguardian: json["isguardian"] ?? "",
        gender: json["gender"] ?? "",
        contactphonenumber: json["contactphonenumber"] ?? null,
        contactmobilenumber: json["contactmobilenumber"] ?? null,
        contactemailid: json["contactemailid"] ?? null,
        //createdby: json["createdby"] ?? "",
        civilid: json["civilid"] ?? "",
        countryid: json["countryid"] ?? null,
        passportnumber: json["passportnumber"] ?? "",
        addressline1: json["addressline1"] ?? "",
        addressline2: json["addressline2"] ?? "",
        regionalarea: json["regionalarea"] ?? "",
        gradeid: json["gradeid"] ?? null,
        schoolid: json["schoolid"] ?? "",
        isfather: json["isfather"] ?? "",
        ismother: json["ismother"] ?? "",
        issameforaddress: json["issameforaddress"] ?? "",
        arabstudentname: json["arabstudentname"] ?? "",
        isprimarycontact: json["isprimarycontact"] ?? "",
        uniformfee: json["uniformfee"] ?? "",
        religion: json["religion"] ?? "",
        studntcode: json["studntcode"] ?? "",
        grade: json["grade"] ?? "",
        schoolname: json["schoolname"] ?? "",
        academicyear: json["academicyear"] ?? "",
        nationality: json["nationality"] ?? "",
        studentcivilexpirydate:
        DateTime.parse(json["studentcivilexpirydate"]) ?? "",
      );

  // String get civilid => null;

  Map<String, dynamic> toJson() => {
        "studentid": studentid,
        "studentname": studentname,
        "studentnumber": studentnumber,
        "userid": userid,
        "birthdate": birthdate,
        "isguardian": isguardian,
        "gender": gender,
        "contactphonenumber": contactphonenumber,
        "contactmobilenumber": contactmobilenumber,
        "contactemailid": contactemailid,
        // "createdby": createdby,
        "civilid": civilid,
        "countryid": countryid,
        "passportnumber": passportnumber,
        "addressline1": addressline1,
        "addressline2": addressline2,
        "regionalarea": regionalarea,
        "gradeid": gradeid,
        "schoolid": schoolid,
        "isfather": isfather,
        "ismother": ismother,
        "issameforaddress": issameforaddress,
        "arabstudentname": arabstudentname,
        "isprimarycontact": isprimarycontact,
        "uniformfee": uniformfee,
        "religion": religion,
        "studntcode": studntcode,
        "grade": grade,
        "schoolname": schoolname,
        "academicyear": academicyear,
        "nationality": nationality,
        "studentcivilexpirydate": studentcivilexpirydate
      };
}

class ParentResponse {
  ParentResponse(
      {this.name,
      this.parentdetailsid,
      this.civilid,
      this.mobilenumber,
      this.emailid,
      this.addressline,
      this.regionalarea,
      this.passportnumber,
      this.type,
      this.arabicname,
      this.dob,
      this.nationality,
      this.parentcivilexpirydate});

  String name;
  int parentdetailsid;
  String civilid;
  String mobilenumber;
  String emailid;
  String addressline;
  String regionalarea;
  String passportnumber;
  String type;
  String arabicname;
  String dob;
  String nationality;
  DateTime parentcivilexpirydate;

  factory ParentResponse.fromJson(Map<String, dynamic> json) => ParentResponse(
        name: json["name"] ?? "",
        parentdetailsid: json["parentdetailsid"] ?? "",
        civilid: json["civilid"] ?? "",
        mobilenumber: json["mobilenumber"] ?? "",
        emailid: json["emailid"] ?? "",
        addressline: json["addressline"] ?? "",
        regionalarea: json["regionalarea"] ?? "",
        passportnumber: json["passportnumber"] ?? "",
        type: json["type"] ?? "",
        arabicname: json["arabicname"] ?? "",
        dob: json["dob"] ?? "",
        nationality: json["nationality"] ?? "",
        parentcivilexpirydate:
            DateTime.parse(json["parentcivilexpirydate"]) ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "civilid": civilid,
        "mobilenumber": mobilenumber,
        "emailid": emailid,
        "addressline": addressline,
        "regionalarea": regionalarea,
        "passportnumber": passportnumber,
        "type": type,
        "arabicname": arabicname,
        "dob": dob,
        "nationality": nationality,
        "parentcivilexpirydate": parentcivilexpirydate,
      };
}

class StudentParse {
  final String AcademicPeriodId;
  final int GrandTotal;
  final bool IsIncludeEnrollment;
  final int KnetpaymentAmount;
  final int OffSet;
  final int OpeningBalance;
  final int StudentId;
  final int Paymentid;

  StudentParse(
      {this.AcademicPeriodId,
      this.GrandTotal,
      this.IsIncludeEnrollment,
      this.KnetpaymentAmount,
      this.OffSet,
      this.OpeningBalance,
      this.StudentId,
      this.Paymentid});

  factory StudentParse.fromJson(Map<String, dynamic> json) {
    return StudentParse(
        AcademicPeriodId: json['AcademicPeriodId'],
        GrandTotal: json['GrandTotal'],
        IsIncludeEnrollment: json['IsIncludeEnrollment'],
        KnetpaymentAmount: json['KnetpaymentAmount'],
        OffSet: json['OffSet'],
        OpeningBalance: json['OpeningBalance'],
        StudentId: json['StudentId'],
        Paymentid: json['Paymentid']);
  }

  // Override toString to have a beautiful log of student object
  @override
  String toString() {
    return '{AcademicPeriodId = $AcademicPeriodId, GrandTotal = $GrandTotal}';
  }

  Map<String, dynamic> toJson() => {
        "AcademicPeriodId": AcademicPeriodId,
        "GrandTotal": GrandTotal,
        "IsIncludeEnrollment": IsIncludeEnrollment,
        "KnetpaymentAmount": KnetpaymentAmount,
        "OffSet": OffSet,
        "OpeningBalance": OpeningBalance,
        "StudentId": StudentId,
        "Paymentid": Paymentid,
      };
}
