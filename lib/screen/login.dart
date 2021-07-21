import 'package:flutter/material.dart';
import 'package:nurture/widget/inputs.dart';
import 'package:nurture/widget/buttons.dart';

class Login extends StatefulWidget{
  LoginPage createState()=> LoginPage();
}


class LoginPage extends State<Login>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _email="";
  String _password="";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child:Form(
          key: formKey,
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: loginInputs()+loginButtons(formKey),
          ),
        ),
    ),
      ),
    );
  }

}
