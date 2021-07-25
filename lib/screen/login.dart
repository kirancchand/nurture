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


  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    return Spinner(
      child:Scaffold(
        body: SingleChildScrollView(
          child:Container(
              margin:EdgeInsets.fromLTRB(48.0,85.0,48.0,0.0),
            child:Column(
              children: <Widget>[
                Container(
                  child:Image.asset('assets/images/img1.PNG')
                ),
                Container(
                  margin: const EdgeInsets.only(top: 82.0),
                  child:Form(
                    key: formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              children:loginInputs(loginRequestModel)
                          ),
                          Column(
                              children:loginButtons(formKey,loginRequestModel)
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )

          )
        ),

    )
    );
  }

}
