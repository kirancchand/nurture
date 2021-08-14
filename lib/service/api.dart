import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/contact.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/model/notification.dart';
import 'package:nurture/model/paymenthistory.dart';
import 'package:nurture/model/paymentpending.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/payment.dart';

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
    // print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return PaymentHistoryResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<PaymentPendingResponseModel> getPendingPayment(
      String valueChoose) async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // String url = "https://run.mocky.io/v3/cdadde32-9982-459b-8d5d-8f1d687a9455";
    var token = await getToken();
    // print(valueChoose);
    final queryParameters = valueChoose;
    final response = await http.get(
        getUrl("getstudentfeedetails?studentId=${queryParameters}"),
        headers: {'Authorization': 'Bearer $token'});
    // final response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      // print("valueChoose");
      // print(queryParameters);
      // print(valueChoose);
      return PaymentPendingResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<StudentContactResponseModel> submitContactRequest(
    StudentContactRequestModel studentContactRequestModel,
    List<PlatformFile> file,
  ) async {
    var token = await getToken();
    //    FormData formData = FormData.fromMap({
    //   "image": await MultipartFile.fromFile(file[0].path, filename: fileName),
    // });

    final response = await http.post(
      getUrl(
          'sendenquiry?studentid=${studentContactRequestModel.toJson()["studentid"]}&Name=${studentContactRequestModel.toJson()["studentname"]}&Email=${studentContactRequestModel.toJson()["studentemail"]}&PhoneNumber=${studentContactRequestModel.toJson()["studentphonenumber"]}&Query=${studentContactRequestModel.toJson()["studentinquiry"]}'),
      headers: {'Authorization': 'Bearer $token'},
    );
    // print("sdsdsd ${json.decode(response.body)}");
    if (response.statusCode == 200 || response.statusCode == 400) {
      // return StudentContactResponseModel.fromJson(json.decode(response.body));
      return StudentContactResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data!');
    }
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
}

// Future<Payment> submitPaymentRequest(
//     List<Map<String, dynamic>> paymentBody) async {
//   print(paymentBody);
//   var enc = jsonEncode(paymentBody);
//   var token = await getToken();
//   var headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $token',
//     'Cookie':
//         'ARRAffinity=94a36c26088811151a0293b8f949eda23429828ef41743d274d54f411258035d'
//   };
//   var request = http.Request('POST',
//       Uri.parse('http://schbackend.azurewebsites.net/api/apps/PostPayment'));
//   request.body = json.encode(enc);
//   request.headers.addAll(headers);

//   // http.StreamedResponse response = await request.send();
//   var data = paymentFromJson(request.body);

//   if (data.statuscode == "200") {
//     return data;
//   } else {
//     return Payment();
//   }
// }

Future<Payment> submitPaymentRequest(
    List<Map<String, dynamic>> paymentBody) async {
  var enc = jsonEncode(paymentBody);
  var token = await getToken();
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
    'Cookie':
        'ARRAffinity=94a36c26088811151a0293b8f949eda23429828ef41743d274d54f411258035d'
  };
  final response =
      await http.post(getUrl('PostPayment'), body: enc, headers: headers);
  // print(response.body);
  try {
    return paymentFromJson(response.body);
  } catch (e) {
    // print(e);
    return Payment();
  }
}

Future<Payment> paymentWeb(List<Map<String, dynamic>> paymentBody) async {
  var enc = jsonEncode(paymentBody);
  var token = await getToken();
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
    'Cookie':
        'ARRAffinity=94a36c26088811151a0293b8f949eda23429828ef41743d274d54f411258035d'
  };

  // print(enc);
  final response = await http.post(getUrl('KnetPaymentGateway'),
      body: enc, headers: headers);
  // print(response.body);
  try {
    return paymentFromJson(response.body);
  } catch (e) {
    // print(e);
    return Payment();
  }
}
