import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';

List<Widget> loginButtons(formKey, loginRequestModel, ) {
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

Widget installment() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Installment 1"),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tution",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "0KD",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Transportation",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "0KD",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Other",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "0KD",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    ),
  );
}

Widget receiptBox(    {bool failed = true}) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Container(
      height: 103,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: .5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  height: 99,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Transaction Id",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "DateTime",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Payment Id",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "txt1a",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "txt1b",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "txt1c",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "300 KD",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: failed
                                        ? Colors.greenAccent
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 83,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    failed
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.greenAccent,
                          )
                        : Icon(
                            Icons.close_rounded, //lose_outlined,
                            color: Colors.red,
                          ),
                    Container(
                        height: 20,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(10)),
                        child: failed
                            ? Center(
                                child: Text(
                                "Download Receipt",
                                style: TextStyle(
                                    fontSize: 8.5, color: Colors.green),
                              ))
                            : Center(
                                child: Text(
                                  "failed transaction",
                                  style: TextStyle(
                                      fontSize: 8.5, color: Colors.grey),
                                ),
                              ))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
