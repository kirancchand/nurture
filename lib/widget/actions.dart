import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/widget/spinner.dart';

bool validateAndSave(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}


Future<LoginResponseModel> validateAndLogin(formKey,loginRequestModel) async {
  Api api = new Api();
  if (validateAndSave(formKey)) {
    showSpinner();
    LoginResponseModel data = await api.signInWithEmailAndPassword(loginRequestModel);
    hideSpinner();
    return data;
  }
  else{
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