import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color colorblue = Color(0xff2682AB);
const kColorGreen = Color(0xff43CEA2);
const kColorGradiant = [Color(0xff43CEA2), Color(0xff279DD4)];
// getUrl(String s) =>
//     Uri.parse("http://schbackend.azurewebsites.net/api/apps/$s");
getUrl(String s) =>
    // Uri.parse("http://schbackend.azurewebsites.net/api/apps/$s");
    Uri.parse("https://schoolbackendliveapp.azurewebsites.net/api/apps/$s");
height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

toastFn({String comment}) {
  return Fluttertoast.showToast(
    msg: comment ?? '',
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorblue,
    fontSize: 14,
  );
}

Future getToken() async {
  var pref = await SharedPreferences.getInstance();
  // print(pref.getString('access_token'));
  return pref.getString('access_token');
}
