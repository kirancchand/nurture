import 'package:flutter/material.dart';
// import 'package:ki/Screens/Home/Home.dart';
// import 'package:ki/Screens/users/signup.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/home.dart';


class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    "/": (BuildContext context) => Login(),
    "/home": (context) => Home(title: 'Flutter Demo Home Pages'),
  };
  static Map<String, WidgetBuilder> getAll() => _routes;
}