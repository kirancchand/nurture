import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/localization.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/config/controller.dart';
class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);
  Settings createState() => Settings();

}

class Settings extends State<SettingsPage> {

  String _selectedLang;
  String _showLang = Get.locale == "en_US" ? "عربي" : "English";
  ChildrenController childlistcon = Get.put(ChildrenController());
  List childrens = [];

  @override
  void initState() {
    // TODO: implement initState
    print("ADSAD${Get.locale}");
    super.initState();
    Future<void> langFunc() async {
      var pref = await SharedPreferences.getInstance();
      print("adasdas${pref.getString('lang')}");
      setState(() {
        _showLang = pref.getString('lang') == "en_US" ? "عربي" : "English";
        _selectedLang = pref.getString('lang') == "en_US" ? "English" : "عربي";
        // _selectedLang = pref.getString('lang') == "en_US" ? "عربي" : "English";
      });
    }
    langFunc();
    // Future.delayed(Duration(seconds: 3)).then((value) async {
    //   var pref = await SharedPreferences.getInstance();
    //   print("adasdas${pref.getString('lang')}");
    // });


//print(_selectedLang);
  }

  @override
  Widget build(BuildContext context) {
    List childrens = childlistcon.childrenlist;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("Settings".tr,
            style: TextStyle(
              color: Colors.white,
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff43CEA2),
            Color(0xff279DD4),
          ])),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text("Notifications".tr),
            onTap: () {
              Get.to(Notifications());
            },
          ),
          Divider(),
          ListTile(
            title: Text("Contact_School".tr),
            onTap: () {
              Get.toNamed('/contactinformation', arguments: childrens);
            },
          ),
          // Divider(),
          // ListTile(
          //   title: Text(_showLang),
          //   onTap: () {
          //     Future<void> changelangFunc(_showLang) async {
          //       var pref = await SharedPreferences.getInstance();
          //       pref.setString('lang',_showLang );
          //       print("adasdas${pref.getString('lang')}");
          //     }
          //     changelangFunc(_showLang== "English"?"en_US":"ar_AB");
          //     Localization().changeLocale(_showLang);
          //     setState(() {
          //       _selectedLang = _showLang;
          //       _showLang=(_showLang== "English") ? "عربي" : "English";
          //     });
          //
          //
          //
          //   },
          // ),
          Divider(),
          ListTile(
            title: Text("Log_off".tr),
            onTap: () async {
              //print("helo");
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('Username', "");
              prefs.setString('access_token', "");
              Get.offAll(Login());
              // Get.to();
            },
          ),
          Divider(),
          ListTile(
            title: Text("Application_version".tr + "v2.0.1"),
            onTap: () {},
          ),
          Divider(),
          // Container (
          //   child: DropdownButton(
          //     // Not necessary for Option 1
          //     value: _selectedLang,
          //     underline: Container(
          //       height: 0,
          //     ),
          //     onChanged: (String newValue) {
          //       // print(newValue);
          //       setState(() => _selectedLang = newValue);
          //       Localization().changeLocale(newValue);
          //       // setState(() => _selectedLang = newValue);
          //     },
          //     items: Localization.langs.map((String lang) {
          //       return DropdownMenuItem(value: lang, child: Text(lang,style: TextStyle(color: kColorGreen)));
          //     }).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
