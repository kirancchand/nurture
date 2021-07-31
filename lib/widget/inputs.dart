import 'package:flutter/material.dart';
import 'package:nurture/widget/validators.dart';

List<Widget> loginInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text(
          "Sign in",
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
    TextFormField(
      key: Key('username'),
      decoration: InputDecoration(
          labelText: ' Enter Username',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      validator: EmailFieldValidator.validate,
      initialValue: "G-0000002102",
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    TextFormField(
      key: Key('password'),
      decoration: InputDecoration(
          labelText: 'Enter Password',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      initialValue: "MBXEXPZX",
      validator: PasswordFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Password = value,
    ),
    SizedBox(
      height: 35,
    ),
  ];
}

List<Widget> otpInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text("Enter 4 digit PIN", style: TextStyle(fontSize: 25)),
      ],
    ),
    TextFormField(
      key: Key('pin'),
      decoration: InputDecoration(
          labelText: ' Enter PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      initialValue: "G-0000002102",
      validator: OtpFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    TextFormField(
      key: Key('confirm'),
      decoration: InputDecoration(
          labelText: 'Confirm PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      initialValue: "MBXEXPZX",
      validator: ConfirmOtpFieldFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Password = value,
    ),
    SizedBox(
      height: 35,
    )
  ];
}



List<Widget> pinInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text("Login", style: TextStyle(fontSize: 25)),
      ],
    ),
    TextFormField(
      key: Key('pin'),
      decoration: InputDecoration(
          labelText: ' Enter PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      initialValue: "MBXEXPZX",
      validator: PinFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    
    SizedBox(
      height: 35,
    )
  ];
}

