import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';

List<Widget> loginButtons(formKey,_email,_password) {

  return <Widget>[
    ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed:() async {
        showSpinner();
        String data = await validateAndLogin(formKey,_email,_password);
        print(jsonDecode(data)["data"]["message"]);
        hideSpinner();
      },
    ),
  ];
}