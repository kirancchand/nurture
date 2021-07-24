import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';
List<Widget> loginButtons(formKey,email,password,loginRequestModel) {

  return <Widget>[
    ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed:() async {
        showSpinner();
        LoginResponseModel data = await validateAndLogin(formKey,email,password,loginRequestModel);
        // String data = await validateAndLogin(formKey,email,password,loginRequestModel);
        print(data);
        hideSpinner();
      },
    ),
  ];
}