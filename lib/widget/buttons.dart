import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';
import 'package:get/get.dart';

List<Widget> loginButtons(
  formKey,
  loginRequestModel,
) {
  return <Widget>[
    GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Color(0xff43CEA2),
                Color(0xff279DD4),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      onTap: () async {
        LoginResponseModel data =
            await validateAndLogin(formKey, loginRequestModel);
        if (data.statuscode == "200") {
          print(data.message);
          print(data.response.access_token);
          Get.toNamed("/otpform");
        } else {
          print(data);
        }
      },
    ),
  ];
}

List<Widget> otpButtons(formKey, loginRequestModel) {
  return <Widget>[
    GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Color(0xff43CEA2),
                Color(0xff279DD4),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      onTap: () async {
        LoginResponseModel data =
            await validateAndLogin(formKey, loginRequestModel);
        if (data.statuscode == "200") {
          print(data.message);
          print(data.response.access_token);
          Get.toNamed("/home");
        } else {
          print(data);
        }
      },
    ),
    Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Lets set your 4 digit PIN for future login",
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    ),
  ];
}

List<Widget> pinButtons(formKey, loginRequestModel) {
  return <Widget>[
    GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: [
                Color(0xff43CEA2),
                Color(0xff279DD4),
              ],
            ),
          ),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      onTap: () async {
        LoginResponseModel data =
            await validateAndLogin(formKey, loginRequestModel);
        if (data.statuscode == "200") {
          print(data.message);
          print(data.response.access_token);
          Get.toNamed("/home");
        } else {
          print(data);
        }
      },
    ),
    Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Lets set your 4 digit PIN for future login",
        style: TextStyle(color: Colors.grey, fontSize: 11),
      ),
    ),
  ];
}

Widget payNowButtons() {
  return Container(
    height: 40,
    width: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: Colors.greenAccent),
    child: Center(
        child: Text(
      "Pay Now",
      style: TextStyle(color: Colors.white),
    )),
  );
}
