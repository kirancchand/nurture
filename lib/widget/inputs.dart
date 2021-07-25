import 'package:flutter/material.dart';
import 'package:nurture/widget/validators.dart';

List<Widget> loginInputs(loginRequestModel) {
  return <Widget>[
    TextFormField(
      key: Key('email'),
      decoration: InputDecoration(labelText: 'Email'),
      validator: EmailFieldValidator.validate,
      onSaved: (String value) =>loginRequestModel.email= value,
    ),
    TextFormField(
      key: Key('password'),
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator:PasswordFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.password=value,
    ),
  ];
}