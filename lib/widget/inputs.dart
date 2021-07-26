import 'package:flutter/material.dart';
import 'package:nurture/widget/validators.dart';

List<Widget> loginInputs(loginRequestModel) {
  return <Widget>[
    TextFormField(
      key: Key('email'),
      decoration: InputDecoration(
          labelText: ' Enter Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      validator: EmailFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.email = value,
    ),
    TextFormField(
      key: Key('password'),
      decoration: InputDecoration(
          labelText: 'Enter Password',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      validator: PasswordFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.password = value,
    ),
    SizedBox(
      height: 35,
    ),
  ];
}

List<Widget> otpInputs(loginRequestModel) {
  return <Widget>[
    TextFormField(
      key: Key('pin'),
      decoration: InputDecoration(
          labelText: ' Enter PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      validator: EmailFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.email = value,
    ),
    TextFormField(
      key: Key('confirm'),
      decoration: InputDecoration(
          labelText: 'Confirm PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      validator: PasswordFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.password = value,
    ),
    SizedBox(
      height: 35,
    )
  ];
}
