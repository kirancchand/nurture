import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:get/get.dart';
>>>>>>> 23c0c6a2579dfbaf9d7013aca9aad86731b0c0e8
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color colorblue = Color(0xff2682AB);
const kColorGreen = Color(0xff43CEA2);
<<<<<<< HEAD
const kColorGradiant = [Color(0xff43CEA2), Color(0xff279DD4)];
getUrl(String s) =>
    Uri.parse("http://schbackend.azurewebsites.net/api/apps/$s");
=======
const kColorGradiant = [Color(0xff43CEA2),Color(0xff279DD4)];
getUrl(String s) => Uri.parse("http://schbackend.azurewebsites.net/api/apps/$s");
>>>>>>> 23c0c6a2579dfbaf9d7013aca9aad86731b0c0e8

height(context) {
  return MediaQuery.of(context).size.height;
}

width(context) {
  return MediaQuery.of(context).size.width;
}

<<<<<<< HEAD
=======

>>>>>>> 23c0c6a2579dfbaf9d7013aca9aad86731b0c0e8
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
<<<<<<< HEAD
}
=======
}
>>>>>>> 23c0c6a2579dfbaf9d7013aca9aad86731b0c0e8
