import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nurture/widget/actions.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/model/login_model.dart';
List<Widget> loginButtons(formKey,loginRequestModel) {

  return <Widget>[
    ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed:() async {

        LoginResponseModel data = await validateAndLogin(formKey,loginRequestModel);
        if(data.statuscode=="200")
          {
            print(data.message);
            print(data.response.access_token);
          }
        else{ 
          print(data);
        }


      },
    ),
  ];
}