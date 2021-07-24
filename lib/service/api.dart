import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nurture/model/login_model.dart';

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

class Api {
  Future<LoginResponseModel> signInWithEmailAndPassword(String email, String password,LoginRequestModel loginRequestModel) async {
    String url = "https://reqres.in/api/login";
    print(loginRequestModel.toJson());
    // return LoginResponseModel(error: '', token: '');
    final response = await http.post(Uri.parse(url), body: loginRequestModel.toJson());
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}