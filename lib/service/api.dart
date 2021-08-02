import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/common/constants.dart';
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
}
class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticateWithBiometrics(
        androidAuthStrings: AndroidAuthMessages(
          signInTitle: 'Face ID Required',
        ),
        localizedReason: 'Scan Face to Authenticate',
        useErrorDialogs: false,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      return false;
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

