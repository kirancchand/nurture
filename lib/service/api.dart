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

  Future<PaymentPendingResponseModel> getPendingPayment(
      String valueChoose) async {
    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // String url = "https://run.mocky.io/v3/cdadde32-9982-459b-8d5d-8f1d687a9455";
    var token = await getToken();
    print(valueChoose);
    final queryParameters = valueChoose;
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
    var token = await getToken();

    // return StudentContactResponseModel.fromJson(stud);
    print(studentContactRequestModel.toJson());
    print(studentContactRequestModel.toJson()["studentid"]);
    // int studentid=studentContactRequestModel.toJson()["studentname"];
    // String Name=studentContactRequestModel.toJson()["studentemail"];
    // String Email=studentContactRequestModel.toJson()["studentid"];
    // String PhoneNumber=studentContactRequestModel.toJson()["studentphonenumber"];
    // String Query=studentContactRequestModel.toJson()["studentinquiry"];

    // String url = "https://run.mocky.io/v3/10dbe39e-ba24-488b-af81-fe10fbc092a0";  // success
    // String url = "https://run.mocky.io/v3/4e1f3524-732a-426c-881b-4ae567685de6";   //failed
    // String url = "https://run.mocky.io/v3/c0586d5b-47fd-4c1b-8eae-277796c80ec6";
    // final response = await http.post(getUrl('sendenquiry?studentid="1"&Name="chitra"&Email="chitra.pzr@gmail.com"&PhoneNumber="974475667"&Query="test"'), body: studentContactRequestModel.toJson());
    final response = await http.post(
        getUrl(
            'sendenquiry?studentid=${studentContactRequestModel.toJson()["studentid"]}&Name=${studentContactRequestModel.toJson()["studentname"]}&Email=${studentContactRequestModel.toJson()["studentemail"]}&PhoneNumber=${studentContactRequestModel.toJson()["studentphonenumber"]}&Query=${studentContactRequestModel.toJson()["studentinquiry"]}'),
        headers: {'Authorization': 'Bearer $token'});
    print("sdsdsd ${json.decode(response.body)}");
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

Future submitPaymentRequest(List<Map<String, dynamic>> paymentBody) async {
  print(paymentBody);
  var token = await getToken();
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
    'Cookie':
        'ARRAffinity=94a36c26088811151a0293b8f949eda23429828ef41743d274d54f411258035d'
  };
  var request = http.Request('POST',
      Uri.parse('http://schbackend.azurewebsites.net/api/apps/PostPayment'));
  request.body = json.encode(paymentBody);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return 'https://kpaytest.com.kw/kpg/PaymentHTTP.htm?param=paymentInit&trandata=6463A5E7E55F698D7CFC0E49BC8E2FA5DC25F60F12D1F35FD72D3CEB496972F487F30A11B1DAF35A21EDBADAF2D50884306E02133AF930A81006AD2053F4C504FF1963A2EB03621EF98EEC6FD69590988D2865F9B25D4655D08FFB4B77EC8C0EA525BF0889BB75B04378015C12501ED4118D0AFEE2CDBA479BA36CBCE8B736B706A556D1277466BB950BEA2206F87EB3E1E7A0E0E45099EC77DF599DCC1B96A98B6B5B10BA51C082AAB2B223C98A1B1AE1D425FAD1012BEEB1138669345FB94C7AAD10348BADA4B1AB220328620A3BD73A9CD54D92D9B70C5406BAD6474E2A0DFA3A97DFA3188D98AEE902367A65E3302236807A208A5D716E36DC9D30FC66E98FD360F59C48153B7E60242A78683D825D8302399958CF12153DB256EE8D82C3C36C8952B6A305CC70E97D747CDF20EE&errorURL=https://schbackend.azurewebsites.net/Controllers/PaymentUrl.html&tranportalId=128701';
    // print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
