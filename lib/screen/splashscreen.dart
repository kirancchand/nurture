import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/login.dart';
import 'package:nurture/screen/home.dart';
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
  StudentController students=Get.put(StudentController());
  List childrens = [];

  @override
  void initState() {


    Future.delayed(Duration(seconds: 3)).then((value) async {
      var pref = await SharedPreferences.getInstance();

      if(pref.getString('Username')==null)
        {
          print("sdfsdfsdf${pref.getString('Username')}");
          Get.off(Login());
          // Get.toNamed('/login');
        }
      else{
        print("sdfsdfsdfnmmmmmm");
        api.getFee().then((fee) {
          con.year.value = fee.response.academicyear;
          childrens = fee.response.children;
          students.student.value=fee;
          // return fee;
          Get.off(()=>Home(fee:fee,childrens:childrens));
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
        child: Image.asset('assets/images/splash.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
