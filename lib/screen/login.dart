import 'package:flutter/material.dart';
import 'package:nurture/widget/inputs.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/widget/spinner.dart';
class Login extends StatefulWidget{
  LoginPage createState()=> LoginPage();
}


class LoginPage extends State<Login>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(email: '', password: '');
  }

  String email="";
  String password="";
  // callback function
  void getEmail(value) {
    setState(() {
      email=value;
    });
  }
  void getPassword(value) {
    setState(() {
      password=value;
    });

  }



  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    return Spinner(
      child:Scaffold(
      body: Container(
        child:Form(
          key: formKey,
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: loginInputs(getEmail,getPassword,loginRequestModel)+loginButtons(formKey,email,password,loginRequestModel),
          ),
        ),
    ),
      ),
    )
    );
  }

}
