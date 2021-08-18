import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/widget/list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({Key key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
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
  List<bool> selectCheck = [];
  bool selectedStudent = false;
  List _selectedStudent = [];
  double total;

  void _onCategorySelected(bool selected, student) {
    if (selected == true) {
      print(student.studentid);
      print(true);
      setState(() {
        _selectedStudent.add(student);
        total = total + student.dueamount;
      });
    } else {
      print(student.studentid);
      print(false);
      setState(() {
        total = total - student.dueamount;
        _selectedStudent.remove(student);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    total = 0.0;
    getFee = api.getFee().then((fee) {
      con.year.value = fee.response.academicyear;
      childrens = fee.response.children;
      selectCheck = List<bool>.filled(childrens.length, false);
      return fee;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<FeeResponseModel>(
            future: api.getFee(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                var response = snapshot.data?.response;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff43CEA2),
                              Color(0xff279DD4),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    "assets/images/arabian-vector-icon-260nw-445427119.png")),
                            SizedBox(
                              height: 10,
                            ),
                            response.parentnumber != ""
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
                                : Center(child: Text("No Data")),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff43CEA2),
                              Color(0xff279DD4),
                            ],
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ), //circular(15),
                            border: Border.all(
                                color: Colors.grey.shade200, width: 1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                    top: 20, left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Students"),
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
                                                color: Colors.grey,
                                                fontSize: 11),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: response.children.length > 0
                                    ? ListView.builder(
                                        itemCount: response.children.length,
                                        shrinkWrap: true,
                                        physics: ClampingScrollPhysics(),
                                        itemBuilder: (context, int index) {
                                          // print(response
                                          //     .children[index].studentname);

                                          return StudentList(
                                              data: response.children[index]);
                                        },
                                      )
                                    : Center(
                                        child: Text("No Data"),
                                      ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  // color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ), //circular(15),
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 15, left: 15, right: 15),
                                      child: Text("Total Fee Outstanding"),
                                    ),
                                    response.children.length > 0
                                        ? ListView.builder(
                                            itemCount: response.children.length,
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemBuilder: (context, int index) {
                                              return ListTile(
                                                leading: Checkbox(
                                                  value: selectCheck[index],
                                                  onChanged: (val) {
                                                    setState(() {
                                                      selectCheck[index] = val;

                                                      // print(selectCheck[index]);
                                                      if (val == true) {
                                                        print(true);
                                                        _selectedStudent.add(
                                                            response.children[
                                                                index]);
                                                        total = total +
                                                            response
                                                                .children[index]
                                                                .dueamount;
                                                      } else if (val == false) {
                                                        print(false);
                                                        total = total -
                                                            response
                                                                .children[index]
                                                                .dueamount;
                                                        // _selectedStudent.remove(
                                                        //     response.children[
                                                        //         index]);
                                                      }
                                                    });
                                                  },
                                                  side: BorderSide(
                                                      color: kColorGreen),
                                                  shape: CircleBorder(),
                                                  activeColor: kColorGreen,
                                                ),
                                                title: Text(
                                                    response.children[index]
                                                        .studentname,
                                                    style: TextStyle(
                                                        color: selectedStudent
                                                            ? kColorGreen
                                                            : Colors.grey)),
                                                trailing: Text(
                                                    response.children[index]
                                                        .dueamount
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: selectedStudent
                                                            ? kColorGreen
                                                            : Colors.grey)),
                                              );
                                            },
                                          )
                                        : Center(child: Text("No Data")),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Total"),
                                          Text(total.toString() + "KD")
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // print("dsfsd${_selectedStudent.length}");
                                        _selectedStudent.length > 0
                                            ? Get.toNamed('/confirmpayment',
                                                arguments: [
                                                    _selectedStudent,
                                                    total
                                                  ])
                                            : Fluttertoast.showToast(
                                                msg:
                                                    'Please Select Atleast one student');
                                      },
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(
                                                    15)), //circular(15),
                                            color: kColorGreen),
                                        child: Center(
                                          child: Text(
                                            "Pay Now",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ContactUs(
                                  context, snapshot.data.response.children),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // ContactUs(context, snapshot.data.response.children),
                    ],
                  ),
                );
              } else
                return Center(
                  child: SpinKitWave(
                      color: Colors.blue, type: SpinKitWaveType.center),
                );
            }),
      ),
    );
  }
}

Widget ContactUs(context, List<FeeResponse> children) {
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
        children.length > 0
            ? Get.toNamed('/contactinformation', arguments: children)
            : Fluttertoast.showToast(msg: 'Please Wait..!!And Try Again');
      });
}