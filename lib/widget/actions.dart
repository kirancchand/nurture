import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/login_model.dart';


bool validateAndSave(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}


Future<LoginResponseModel> validateAndLogin(formKey,email,password,loginRequestModel) async {
  Api api = new Api();
  if (validateAndSave(formKey)) {
    LoginResponseModel data = await api.signInWithEmailAndPassword(email,password,loginRequestModel);
    return data;
  }
  else{
    return LoginResponseModel(error: '', token: '');
  }

  // if (validateAndSave(formKey)) {
  //   final String userId = await api.signInWithEmailAndPassword(email,password);
  //   return userId;
  // }
  // else{
  //   return "";
  // }

}