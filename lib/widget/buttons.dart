import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';

List<Widget> loginButtons(formKey, loginRequestModel, {bool asim = false}) {
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
        } else {
          print(data);
        }
      },
    ),
  ];
}

Widget studentsList() {
  return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.pink.shade300,
        // backgroundImage: AssetImage(img),
      ),
      title: Text("Asim Muhammad"),
      isThreeLine: true,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Student Id 849302hjk",
            style: TextStyle(fontSize: 11),
          ),
          Text("Al Mina aljadeed", style: TextStyle(fontSize: 11))
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.green,
        ),
      ));
}

Widget outstandingPayment({bool asim = false}) {
  return ListTile(
    leading: Checkbox(
      value: asim,
      onChanged: (value) {
        /* setState(() {
                this.asim = value!;
              });*/
      },
      side: BorderSide(color: Colors.green),
      shape: CircleBorder(),
      activeColor: Colors.green,
    ),
    title: Text("Asim Muhammad", style: TextStyle(color: Colors.grey)),
    selected: true,
    horizontalTitleGap: 1,
    trailing: Text("300 KD", style: TextStyle(color: Colors.grey)),
  );
}
