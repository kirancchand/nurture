import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/localization.dart';

class Login extends StatefulWidget {
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  String _selectedLang = Localization.langs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login page",
                style: TextStyle(fontSize: 25),
              ),
              //// textField only for Simple UI, there is not event happening in it
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                    decoration: InputDecoration(
                  hintText: "User Name",
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: TextField(
                    decoration: InputDecoration(
                  hintText: "Password",
                )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  // after Login successful remove all the previous screen visited and goto dashboard page
                  Get.toNamed('/home');
                },
                child: Text('Login'),
              ),
              SizedBox(
                height: 10,
              ),
              //// Go to Registration page is new user using getx toNamed properties
              GestureDetector(
                  onTap: () => Get.toNamed('/reg'),
                  child: Text("New User? Register Now")),
              Text('hello'.tr),
              SizedBox(height: 20),
              DropdownButton(
                // Not necessary for Option 1
                value: _selectedLang,
                onChanged: (String newValue) {
                  // print(newValue);
                  setState(() => _selectedLang = newValue);
                  Localization().changeLocale(newValue);
                  // setState(() => _selectedLang = newValue);
                },
                items: Localization.langs.map((String lang) {
                  return DropdownMenuItem(value: lang, child: Text(lang));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
