import 'package:flutter/material.dart';
// import 'package:ki/Screens/Home/Home.dart';
// import 'package:ki/Screens/users/signup.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/otpform.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/screen/paymentpending.dart';


class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/login": (BuildContext context) => Login(),
    "/otpform": (BuildContext context) => OtpForm(),
    "/": (context) => Home(title: 'Flutter Demo Home Pages'),
    "/paymentpending": (context) => PaymentPending(),
  };
  static Map<String, WidgetBuilder> getAll() => _routes;
}