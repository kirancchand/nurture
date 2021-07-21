import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/widget/spinner.dart';

bool validateAndSave(formKey) {
  final FormState form = formKey.currentState;
  if (form.validate()) {
    form.save();
    return true;
  }
  return false;
}


Future<void> validateAndLogin(formKey) async {
  showSpinner();
  if (validateAndSave(formKey)) {
    print("hyy");
  }
  hideSpinner();
}