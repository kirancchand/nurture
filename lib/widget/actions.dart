import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/service/api.dart';

bool validateAndSave(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}


Future<String> validateAndLogin(formKey,_email,_password) async {

  if (validateAndSave(formKey)) {
    final String userId = await Api().signInWithEmailAndPassword(_email,_password);
    return userId;
  }
  else{
    return "";
  }

}