import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nurture/screen/login.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text("Settings ",
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
            
          ),Divider(),
            ListTile(
            title: Text("Contact School"),
            onTap: (){},
            
          ),Divider(),
            ListTile(
            title: Text("LogOff"),
             onTap: () async {
                print("helo");
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('Username', "");
                prefs.setString('access_token', "");
                Get.offAll(Login());
                // Get.to();
              },
            
          ),Divider(),
            ListTile(
            title: Text("App Version"),
            onTap: (){},
            
          ),Divider(),
        ],
      ),
    );
  }
}
