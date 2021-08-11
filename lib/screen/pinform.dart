import 'package:flutter/material.dart';
import 'package:nurture/widget/inputs.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/widget/indexheader.dart';
import 'package:nurture/widget/indexfooter.dart';
class PinForm extends StatefulWidget{
  PinFormPage createState()=> PinFormPage();
}


class PinFormPage extends State<PinForm>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(Username: '', Password: '');
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
                Column(
                  children:indexHeader(),
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
                              children:pinInputs(loginRequestModel)
                          ),
                          Column(
                              children:pinButtons(formKey,loginRequestModel)
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children:indexFooter(),
                ),
              ],
            )

          )
        ),

    )
    );
  }

}
