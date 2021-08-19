import 'package:flutter/material.dart';
import 'package:nurture/screen/confirmpayment.dart';
// import 'package:ki/Screens/Home/Home.dart';
// import 'package:ki/Screens/users/signup.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/screen/paymentpending.dart';
import 'package:nurture/screen/contactinformation.dart';
import 'package:nurture/screen/splashscreen.dart';
import 'package:nurture/screen/modeldownload.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (BuildContext context) => SplashScreen(),
    "/login": (BuildContext context) => Login(),
    "/home": (context) => Home(title: 'Flutter Demo Home Pages'),
    "/paymentpending": (context) => PaymentPending(),
    "/contactinformation": (context) => ContactInformation(),
    "/confirmpayment": (context) => ConfirmPayment(),
    "/download": (context) => ModelDownload(),
  };
  static Map<String, WidgetBuilder> getAll() => _routes;
}