import 'package:flutter/material.dart';
import 'package:nurture/widget/inputs.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/widget/indexheader.dart';
import 'package:nurture/widget/indexfooter.dart';
import 'package:nurture/localization.dart';
import 'package:nurture/common/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget{
  LoginPage createState()=> LoginPage();
}


class LoginPage extends State<Login>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  String _selectedLang = Localization.langs.first;

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(Username: '', Password: '');
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var pref = await SharedPreferences.getInstance();
      print("selected${_selectedLang}");
      pref.setString('lang',_selectedLang );
      // print("getlang${pref.getString('lang')}");
     // print("adasdas${pref.getString('lang')}");
    });
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();
    return Spinner(
      child:Scaffold(
        resizeToAvoidBottomInset: true,
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
                Column(
                  // children:indexFooter(context),
                  children: [
                    SizedBox(height: 60,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                      // Text('hello'.tr),
                                      Text(
                                        "Language:  ",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Container (
                                        child: DropdownButton(
                                          // Not necessary for Option 1
                                          value: _selectedLang,
                                          underline: Container(
                                            height: 0,
                                          ),
                                          onChanged: (String newValue) {
                                           print("loginvalue"+newValue);
                                            Future<void> changelangFunc(_showLang) async {
                                              var pref = await SharedPreferences.getInstance();
                                              print("adasdas${_showLang}");
                                              pref.setString('lang',_showLang );
                                              print("getlang${pref.getString('lang')}");
                                            }
                                            changelangFunc(newValue);
                                            // pref.setString('lang',_showLang );
                                            setState(() => _selectedLang = newValue);
                                            Localization().changeLocale(newValue);
                                            // setState(() => _selectedLang = newValue);
                                          },
                                          items: Localization.langs.map((String lang) {
                                            return DropdownMenuItem(value: lang, child: Text(lang,style: TextStyle(color: kColorGreen)));
                                          }).toList(),
                                        ),
                                      ),

                                  // Text(
                                  //   "English  ",
                                  //   style: TextStyle(color: kColorGreen),
                                  // ),
                                  // Icon(
                                  //   Icons.check_circle,
                                  //   color: kColorGreen,
                                  //   size: 15,
                                  // )
                                ],
                              )

                            ),
                            SizedBox(
                              height: 10,
                            ),
                              Center(
                                child: Text(
                                  "Al_Jeel_Al_Jadeed_Educational_Institution".tr,
                                  style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                                )
                              )

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height:52),
                  ],
                ),
              ],
            )

          )
        ),

    )
    );
  }

}
