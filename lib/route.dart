import 'package:flutter/material.dart';
import 'package:nurture/screen/confirmpayment.dart';
// import 'package:ki/Screens/Home/Home.dart';
// import 'package:ki/Screens/users/signup.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/otpform.dart';
import 'package:nurture/screen/pinform.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/screen/paymentpending.dart';
import 'package:nurture/screen/contactinformation.dart';


class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (BuildContext context) => Login(),
    "/otpform": (BuildContext context) => OtpForm(),
    "/pinform": (BuildContext context) => PinForm(),
    "/home": (context) => Home(title: 'Flutter Demo Home Pages'),
    "/paymentpending": (context) => PaymentPending(),
    "/contactinformation": (context) => ContactInformation(),
    "/confirmpayment": (context) => ConfirmPayment(),
  };
  static Map<String, WidgetBuilder> getAll() => _routes;
}