import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/contact.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/model/notification.dart';
import 'package:nurture/model/paymenthistory.dart';
import 'package:nurture/model/paymentpending.dart';
import 'package:nurture/model/student.dart';

class Api {
  Future<LoginResponseModel> signInWithEmailAndPassword(
      LoginRequestModel loginRequestModel) async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    final response =
        await http.post(getUrl('login'), body: loginRequestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<StudentResponseModel> getStudent() async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // String url = "https://run.mocky.io/v3/cdadde32-9982-459b-8d5d-8f1d687a9455";
    var token = await getToken();
    final response = await http.get(getUrl("GetBasicDetails"), headers: {
      'Authorization': 'Bearer $token',
    });
    // final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 400) {
      return StudentResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<FeeResponseModel> getFee() async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    var token = await getToken();
    final response = await http.get(getUrl('GetAllDetails'), headers: {
      'Authorization': 'Bearer $token',
    });
    // print(jsonDecode(response.body));
    if (response.statusCode == 200 || response.statusCode == 400) {
      return FeeResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<PaymentHistoryResponseModel> getPaymentHistory() async {
    var token = await getToken();
    final response = await http.get(getUrl('PaymentHistory'), headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return PaymentHistoryResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<PaymentPendingResponseModel> getPendingPayment() async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // String url = "https://run.mocky.io/v3/cdadde32-9982-459b-8d5d-8f1d687a9455";
    var token = await getToken();
    final queryParameters = "1375";
    final response = await http.get(
        getUrl("getstudentfeedetails?studentId=${queryParameters}"),
        headers: {'Authorization': 'Bearer $token'});
    // final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return PaymentPendingResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<StudentContactResponseModel> submitContactRequest(
      StudentContactRequestModel studentContactRequestModel) async {
    print(studentContactRequestModel.toJson());
    var stud = {
      "statuscode": "200",
      "response": {
        "access_token":
            "G4WuNVe5c-vN8cybn7KUXkALKfRkOhDCGKjYFwS1XDpW6O57thAdzdFIRewFXe_vTtOrw5kdYmylHwIEEVxyDfEWIMvmwx7_bVYHmw-TISIWEf7_y34KviTxDzkLXqysj00oydbC75eglOy9GN_39E1QrtlfXispKyvMAcNHqBVzIkTBgQVLeydrMgUIKdSchz8cGhIBrbxb4qw8d8Go3dywTYgc7b3ZVZdTezT0IT8dt-1gCsja9MNlo-hbntaCBxNksGc75RLXcftVxHJXdppKl9XN05qwYFllKK2aY7zJQXlLsohPtFAfUHkXlzHWDquZtybj3CpjCfzwr1cK-qxRw1EtLm1X_9lvVx6s3vKhstVgv2cWqKbnZ2rjIVgEaO2RJvmjfw65scEtxAkPBOctgQjqX43L-xpd-Mjra02iH7dOdzM3kxoLq1Q_jbiyX1SFHRYYYu0O1jR7pGAeCjTusqS07-QUQyHjfNvLsk918fcAtRCyKGFsx8OT9odtt6VHf3B1lNT1RNQ101mHcg",
      },
      "message": "Success"
    };
    return StudentContactResponseModel.fromJson(stud);
    // print(studentContactRequestModel.toJson());
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // final response = await http.post(getUrl('login'), body: studentContactRequestModel.toJson());
    // if (response.statusCode == 200 || response.statusCode == 400) {
    //   return StudentContactResponseModel.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to load data!');
    // }
  }

  Future<NotificationResponseModel> getNotification(String valueChoose) async {
    var token = await getToken();
    final queryParameters = valueChoose;
    final response = await http
        .get(getUrl("getnotifications?studentid=${queryParameters}"), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200 || response.statusCode == 400) {
      return NotificationResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }



  Future<String> submitPaymentRequest(List childrens) async {

// studentid;
//  dueamount;

    // "AcademicPeriodId": "2020-2021",
    // "GrandTotal" : 2402,
    // "IsIncludeEnrollment" : false,
    // "KnetpaymentAmount" : 2402,
    // "OffSet" : -330,
    // "OpeningBalance" : 0,
    // "StudentId" : 2920,
    // "Paymentid" :0
    return "hyyooo";




  }

}



// class Api {
//
//   @override
//   Future<String> signInWithEmailAndPassword(String email, String password) async {
//
//     // final response = await http.get(Uri.parse("https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6"), body: {
//     //   "username": email,
//     //   "password": password,
//     // });
//     final response = await http.get(Uri.parse("https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6"));
//     print(jsonDecode(response.body));
//     return response.body;
//     // final FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//     // return user?.uid;
//   }
//
// }
