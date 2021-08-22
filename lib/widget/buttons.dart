import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/screen/PaymentWebPage.dart';
import 'package:nurture/screen/confirmpayment.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nurture/model/contact.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/screen/home.dart';
Api api = new Api();
Future<FeeResponseModel> getFee;


List childrens = [];

List<Widget> loginButtons(
  formKey,
  loginRequestModel,
) {
  PendingDropDown con = Get.put(PendingDropDown());
  YearController cont = Get.put(YearController());
  StudentController students=Get.put(StudentController());
  ChildrenController childlistcon=Get.put(ChildrenController());
  return <Widget>[
    GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: kColorGradiant,
            ),
          ),
          child: Center(
            child: Text(
              "Sign In",
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
          toastFn(comment: data.message);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          con.text.value = '';
          // prefs.setString('Username', null);
          // prefs.setString('access_token', "");
          prefs.setString('Username', "${data.response.Username}");
          prefs.setString('access_token', "${data.response.access_token}");
          // print("DSFDS" + data.message);
          // print(data.response.access_token);
          showSpinner();
          api.getFee().then((fee) {
            cont.year.value = fee.response.academicyearid;
            childlistcon.childrenlist=fee.response.children;
            childrens = fee.response.children;
            students.student.value=fee;
            // return fee;
            hideSpinner();
            Get.off(()=>Home(fee:fee,childrens:childrens));
          });
          // Get.toNamed("/home");
        } else {
          toastFn(comment: data.message);
        }
      },
    ),
  ];
}

Widget payNowButtons(List<Map<String, dynamic>> stu, context) {
  return GestureDetector(
    child: Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kColorGreen),
      child: Center(
        child: Text(
          "Pay Now",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ),
    onTap: () async {
      showSpinner();
      var data = await submitConfirmPayment(stu);
      hideSpinner();
      // Navigator.of(
      //   context,
      //   rootNavigator: true,
      // ).pop();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentWebPage(
            link: data.response ?? "",
          ),
        ),
      );
      // Get.toNamed("/confirmpayment");
    },
  );
}

Widget submitButtons(formKey, studentContactRequestModel, x) {
  // debugPrint("studentContactRequestModel");
  return GestureDetector(
    child: Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kColorGreen),
      child: Center(
          child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      )),
    ),
    onTap: () async {
      StudentContactResponseModel data = await validateAndSubmitContact(
          formKey, studentContactRequestModel, x);
      // if (data.statuscode == "200") {
      //   toastFn(comment: data.message);
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   prefs.setString('Username', "${data.response.Username}");
      //   prefs.setString('access_token', "${data.response.access_token}");
      //   print("DSFDS"+data.message);
      //   print(data.response.access_token);
      //   Get.toNamed("/home");
      // } else {
      //   toastFn(comment: data.message);
      // }
    },
  );
}

List<Widget> contactReqButton(
  formKey,
  studentContactRequestModel,
  x,
) {
  return <Widget>[
    GestureDetector(
      child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: LinearGradient(
              colors: kColorGradiant,
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
        StudentContactResponseModel data = await validateAndSubmitContactReq(
            formKey, studentContactRequestModel, x);
        if (data.statuscode == "200") {
          toastFn(comment: data.message);
          Get.toNamed("/home");
        } else {
          toastFn(comment: data.message);
        }
      },
    ),
  ];
}

// Widget confirmButtons(childrens) {
//   print(jsonDecode(childrens));
//   return Container(
//     height: 40,
//     width: 200,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16), color: kColorGreen),
//     child: Center(
//         child: Text(
//       "Confirm Payment",
//       style: TextStyle(color: Colors.white),
//     )),
//   );
// }



// Widget confirmButtons(childrens,total) {
//   return GestureDetector(
//     child:Container(
//       height: 40,
//       width: 200,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16), color: kColorGreen),
//       child: Center(
//           child: Text(
//             "Confirm Payment",
//             style: TextStyle(color: Colors.white),
//           )),
//     ),
//     onTap: () async {
//       String data = await submitConfirmPayment(childrens,total);
//       print(data);
//     },
//   );
// }