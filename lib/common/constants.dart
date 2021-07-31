import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color colorblue = Color(0xff2682AB);
const kColorGreen = Color(0xff43CEA2);
const kColorGradiant = [Color(0xff43CEA2),Color(0xff279DD4)];
getUrl(String s) => Uri.parse("http://melons-001-site6.htempurl.com/api/apps/$s");

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