import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';

List<Widget> loginButtons(formKey) {
  return <Widget>[
    ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed:() {
        validateAndLogin(formKey);
      },
    ),
  ];
}