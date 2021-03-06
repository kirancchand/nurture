import 'package:flutter/material.dart';
import 'package:nurture/widget/validators.dart';

List<Widget> loginInputs(getEmail,getPassword) {
  return <Widget>[
    TextFormField(
      key: Key('email'),
      decoration: InputDecoration(labelText: 'Email'),
      validator: EmailFieldValidator.validate,
      onChanged: (text){
        getEmail(text);
      },
      onSaved: (String? value) => value!,
    ),
    TextFormField(
      key: Key('password'),
      decoration: InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator:PasswordFieldValidator.validate,
      onChanged: (text){
        getPassword(text);
      },
      onSaved: (String? value) => value!,
    ),
  ];
}