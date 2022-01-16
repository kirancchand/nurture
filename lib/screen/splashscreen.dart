import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurture/localization.dart';
// import 'package:nurture/screen/test.dart';
class SplashScreen extends StatefulWidget {
  SplashScreen({Key key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Api api = new Api();
  Future<StudentResponseModel> getStudents;
  Future<FeeResponseModel> getFee;
  YearController con = Get.put(YearController());
  StudentController students = Get.put(StudentController());
  ChildrenController childlistcon = Get.put(ChildrenController());

  List childrens = [];
  FeeResponse childr;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var pref = await SharedPreferences.getInstance();
      //print("sdfsdfsdf${pref.getString('Username')}");
      if (pref.getString('Username') == null ||
          pref.getString('Username') == "") {
        //  print("sdfsdfsdf${pref.getString('Username')}");
        Get.offAll(Login());
        // Get.toNamed('/login');
      } else {
         //print("mylang"+pref.getString('lang'));


        api.getFee().then((fee) {
          //   print(fee.statuscode);
          if (fee.statuscode == "200") {
            con.year.value = fee.response.academicyearid;
            childrens = fee.response.children;
            childlistcon.childrenlist = fee.response.children;
            students.student.value = fee;
            print("cache${pref.getString('lang')}");
            Localization().changeLocale(pref.getString('lang'));
              Get.off(() => Home(fee: fee, childrens: childrens));
          } else {
            Fluttertoast.showToast(msg: "Something went Wrong");
            Get.offAll(Login());
          }

          // return fee;
        });

        // Get.toNamed("/home",arguments: [getFee,childrens]);
      }
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/images/splashwhite.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
