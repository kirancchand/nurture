import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/paymenthistory.dart';
import 'package:nurture/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Future<LoginResponseModel> signInWithEmailAndPassword(LoginRequestModel loginRequestModel) async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    final response = await http.post(getUrl('login'), body: loginRequestModel.toJson());
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
    String url = "https://run.mocky.io/v3/cdadde32-9982-459b-8d5d-8f1d687a9455";
    var token=await getToken();
    // final response = await http.get(getUrl("GetBasicDetails"),headers: {
    //   'Authorization': 'Bearer $token',
    // });
    final response = await http.get(Uri.parse(url));

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
    var token=await getToken();
    final response = await http.get(getUrl('GetAllDetails'),headers: {
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
    var token=await getToken();
    final response = await http.get(getUrl('PaymentHistory'),headers: {
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return PaymentHistoryResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
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

