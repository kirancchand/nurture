import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/confirmpayment.dart';
import 'package:nurture/screen/contactinformation.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Api api = new Api();
  Future<StudentResponseModel> getStudents;
  Future<FeeResponseModel> getFee;
  YearController con = Get.put(YearController());
  List<String> _texts = [
    "InduceSmile.com",
    "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  String parentName;
  List childrens = [];
  bool selectedStudent = false;
  List _selectedStudent = [];
  double total = 0.0;
  void _onCategorySelected(bool selected, student) {
    if (selected == true) {
      setState(() {
        _selectedStudent.add(student);
        total = total + student.dueamount;
      });
    } else {
      setState(() {
        total = total - student.dueamount;
        _selectedStudent.remove(student);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    // getStudents = api.getStudent().then((student) {
    //   childrens = student.response.childrens;
    //   // print('academic yaea');
    //   // print(student.response.childrens[0].academicyear);
    //   // con.year.value = student.response.childrens[0].academicyear;
    //   // Future.delayed(Duration(seconds: 1)).then((value) async {
    //   //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   //   pref.setString("ay", student.response.childrens[0].academicyear);
    //   // });
    //   return student;
    // });
    getFee = api.getFee().then((fee) {
      con.year.value = fee.response.academicyearid;
      childrens = fee.response.children;
      return fee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              // Student(),
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff43CEA2),
                        Color(0xff279DD4),
                      ],
                    ),
                  ),
                ),
                Column(children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: new SizedBox(
                                height: 18.0,
                                width: 18.0,
                                child: new IconButton(
                                    padding: new EdgeInsets.all(0.0),
                                    icon: new Icon(Icons.settings,
                                        color: Colors.white),
                                    onPressed: () async {
                                      // print("helo");
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString('Username', "");
                                      prefs.setString('access_token', "");
                                      Get.toNamed('/');
                                    }))),
                      )),
                  CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                          "assets/images/arabian-vector-icon-260nw-445427119.png")),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: FutureBuilder<FeeResponseModel>(
                      future: getFee,
                      builder: (BuildContext context,
                          AsyncSnapshot<FeeResponseModel> snapshot) {
                        if (snapshot.hasData) {
                          var response = snapshot.data?.response;

                          // // data.response.length>0?
                          // var response=[];
                          return response.parentnumber != ""
                              ? Column(children: [
                                  Text(
                                    response.parentname,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Parent ID: ${response.parentnumber}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ])
                              : Center(child: Text("No Data"));
                        } else if (snapshot.hasError) {
                          // return Text("${snapshot.error}");
                          return Text("${snapshot.error}");
                        } else {
                          // return Container();
                          return Center(
                              child: SpinKitChasingDots(
                            color: Colors.blue,
                          ));
                        }

                        // By default, show a loading spinner.
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Student".tr),
                                Row(
                                  children: [
                                    Text(
                                      "Academic year:",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    ),
                                    Obx(
                                      () => Text(
                                        con.year.value ?? "",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: FutureBuilder<FeeResponseModel>(
                              future: getFee,
                              builder: (BuildContext context,
                                  AsyncSnapshot<FeeResponseModel> snapshot) {
                                if (snapshot.hasData) {
                                  var response = snapshot.data?.response;
                                  // // data.response.length>0?
                                  // var response=[];
                                  //(response.children.length);
                                  return response.children.length > 0
                                      ? ListView.builder(
                                          itemCount: response.children.length,
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          itemBuilder: (context, int index) {
                                            //print(response.children[index].studentname);

                                            return StudentList(
                                                data: response.children[index]);
                                          },
                                        )
                                      : Center(child: Text("No Data"));
                                } else if (snapshot.hasError) {
                                  // return Text("${snapshot.error}");
                                  return Text("${snapshot.error}");
                                } else {
                                  return Center(
                                    child: SpinKitWave(
                                        color: Colors.blue,
                                        type: SpinKitWaveType.center),
                                  );
                                }

                                // By default, show a loading spinner.
                              },
                            ),
                            // child:ListView.builder(
                            //   itemCount: 3,
                            //   shrinkWrap: true,
                            //   physics: ClampingScrollPhysics(),
                            //   itemBuilder: (context, int index) {
                            //     return StudentList();
                            //   },
                            // ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])
              ]),
              SizedBox(
                height: 15,
              ),
              OutStandingSection(),
              SizedBox(height: 10),
              ContactUs(),

              SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  Widget OutStandingSection() {
    return Container(
      //height: MediaQuery.of(context).size.height*.488,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), //circular(15),
        border: Border.all(color: Colors.grey.shade200, width: 1),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Total Fee Outstanding"),
          ),
          Container(
            child: Form(
                child: Column(children: [
              FutureBuilder<FeeResponseModel>(
                future: getFee,
                builder: (BuildContext context,
                    AsyncSnapshot<FeeResponseModel> snapshot) {
                  if (snapshot.hasData) {
                    var response = snapshot.data?.response;
                    //print(response.children.length);
                    // // data.response.length>0?
                    // var response=[];
                    return response.children.length > 0
                        ? ListView.builder(
                            itemCount: response.children.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, int index) {
                              // print(response);
                              // total = total + response[index].dueamount;
                              // print(total);
                              // return OutstandingPayment(data:response[index]);
                              return ListTile(
                                leading: Checkbox(
                                  value: _selectedStudent
                                      .contains(response.children[index]),
                                  onChanged: (bool selected) {
                                    _onCategorySelected(
                                        selected, response.children[index]);
                                  },
                                  side: BorderSide(color: kColorGreen),
                                  shape: CircleBorder(),
                                  activeColor: kColorGreen,
                                ),
                                title: Text(
                                    response.children[index].studentname,
                                    style: TextStyle(
                                        color: selectedStudent
                                            ? kColorGreen
                                            : Colors.grey)),
                                trailing: Text(
                                    response.children[index].dueamount
                                        .toString(),
                                    style: TextStyle(
                                        color: selectedStudent
                                            ? kColorGreen
                                            : Colors.grey)),
                              );

                              //   ListTile(
                              //   leading: Checkbox(
                              //     value: selectedStudent,
                              //     onChanged: (value) {
                              //       setState(() {
                              //         this.selectedStudent = value;
                              //       });
                              //     },
                              //     side: BorderSide(color: kColorGreen),
                              //     shape: CircleBorder(),
                              //     activeColor: kColorGreen,
                              //   ),
                              //
                              //   title:
                              //   Text(response[index].studentname, style: TextStyle(color:selectedStudent? kColorGreen:Colors.grey)),
                              //   selected: true,
                              //   horizontalTitleGap: 1,
                              //   trailing: Text(response[index].dueamount.toString(),
                              //       style: TextStyle(color:selectedStudent?kColorGreen: Colors.grey)),
                              // );
                            },
                          )
                        : Center(child: Text("No Data"));
                  } else if (snapshot.hasError) {
                    // return Text("${snapshot.error}");
                    return Text("${snapshot.error}");
                  } else {
                    return Center(
                        child: SpinKitWave(
                      color: Colors.blue,
                    ));
                  }

                  // By default, show a loading spinner.
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total"), Text(total.toString() + "KD")],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // print("dsfsd${_selectedStudent.length}");
                  _selectedStudent.length > 0
                      ? Get.toNamed('/confirmpayment',
                          arguments: [_selectedStudent, total])
                      : Fluttertoast.showToast(
                          msg: 'Please Select Atleast one student');
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(15)), //circular(15),
                      color: kColorGreen),
                  child: Center(
                    child: Text("Pay Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ])),

            // child:ListView.builder(
            //   itemCount: 3,
            //   shrinkWrap: true,
            //   physics: ClampingScrollPhysics(),
            //   itemBuilder: (context, int index) {
            //     return StudentList();
            //   },
            // ),
          ),
        ],
      ),
    );
  }

  Widget ContactUs() {
    return GestureDetector(
        child: Container(
            // height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200, width: 1),
              color: Colors.white,
            ),
            child: Center(
              child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: kColorGreen,
                  ),
                  title: Text("Contact Us"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined,
                      color: kColorGreen)),
            )),
        onTap: () {
          // print(childrens);
          childrens.length > 0
              ? Get.toNamed('/contactinformation', arguments: childrens)
              : Fluttertoast.showToast(msg: 'Please Wait..!!And Try Again');
        });
  }
}
