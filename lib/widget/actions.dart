import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/contact.dart';
import 'package:nurture/model/payment.dart';
import 'dart:developer' as developer;

bool validateAndSave(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}

bool validateAndSubmit(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}

Future<LoginResponseModel> validateAndLogin(formKey, loginRequestModel) async {
  Api api = new Api();
  if (validateAndSave(formKey)) {
    showSpinner();
    LoginResponseModel data =
        await api.signInWithEmailAndPassword(loginRequestModel);
    hideSpinner();
    return data;
  } else {
    return LoginResponseModel();
  }

  // if (validateAndSave(formKey)) {
  //   final String userId = await api.signInWithEmailAndPassword(email,password);
  //   return userId;
  // }
  // else{
  //   return "";
  // }
}

Future<StudentContactResponseModel> validateAndSubmitContactReq(
    formKey, studentContactRequestModel) async {
  Api api = new Api();
  if (validateAndSave(formKey)) {
    showSpinner();
    StudentContactResponseModel data =
        await api.submitContactRequest(studentContactRequestModel);
    // print("action${data.message}");
    hideSpinner();
    return data;
  } else {
    return StudentContactResponseModel();
  }

  // if (validateAndSave(formKey)) {
  //   final String userId = await api.signInWithEmailAndPassword(email,password);
  //   return userId;
  // }
  // else{
  //   return "";
  // }
}

Future<StudentContactResponseModel> validateAndSubmitContact(
    formKey, studentContactRequestModel) async {
  Api api = new Api();
  // if (validateAndSubmit(formKey)) {
  showSpinner();
  StudentContactResponseModel data =
      await api.submitContactRequest(studentContactRequestModel);
  hideSpinner();
  return data;
  // }
  // else{
  //   return StudentContactResponseModel();
  // }
}

Future<Payment> submitConfirmPayment(
    List<Map<String, dynamic>> paymentList) async {
  showSpinner();
  Payment data = await submitPaymentRequest(paymentList);
  if (data.statuscode == '200') {
    Payment d = await paymentWeb(paymentList);
    if (d.statuscode == '200') {
      hideSpinner();
      return d;
    } else
      hideSpinner();
    return Payment();
  } else {
    hideSpinner();
    return Payment();
  }

  // return data;
}
