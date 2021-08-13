import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/model/notification.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/widget/spinner.dart';

import 'home.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String _valueChoose;
  Api api = new Api();
  List childrens = [];
  Future<StudentResponseModel> getStudents;
  DropDown controller = Get.put(DropDown());

  // List listItem = ["All", "Asim Muhammad", "Dana Muhammad", "Dalal Muhammad"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStudents = api.getStudent().then((student) {
      childrens = student.response.childrens;
      // for (int i = 0; i < childrens.length; i++)
      //   print(childrens[i].studentname);
      // print('000');
      setState(() {
        controller.text.value = controller.text.value.isEmpty
            ? childrens[0].studentid.toString()
            : controller.text.value;
        // _valueChoose = childrens[0].studentid.toString();
      });

      return student;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Spinner(
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .30,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .17,
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Text("Notifications",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(
                          height: 17,
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height * .137,
                          width: MediaQuery.of(context).size.width * .85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ],
                              color: Colors.white),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Student",
                                    style: TextStyle(color: kColorGreen),
                                  ),

                                  Center(
                                    child: FutureBuilder(
                                      future: getStudents,
                                      // ignore: missing_return
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return DropdownButton(
                                            isExpanded: true,
                                            icon: Icon(
                                              Icons
                                                  .keyboard_arrow_down_outlined,
                                              color: kColorGreen,
                                            ),
                                            value: controller.text.value,
                                            onChanged: (newValue) {
                                              setState(() {
                                                controller.text.value =
                                                    newValue;
                                                print(_valueChoose);
                                              });
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(
                                                    count: 3,
                                                  ),
                                                ),
                                              );
                                            },
                                            items: childrens.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem.studentid
                                                    .toString(),
                                                child:
                                                    Text(valueItem.studentname),
                                              );
                                            }).toList(),
                                          );
                                        } else if (snapshot.hasError) {
                                          // return Text("${snapshot.error}");
                                          return Text("${snapshot.error}");
                                        } else {
                                          return LinearProgressIndicator();
                                        }
                                      },
                                    ),
                                  )
                                  // DropdownButtonFormField(items: items)
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            controller.text.value.isEmpty
                ? Container(
                    child: Center(
                      child: Text('Empty'),
                    ),
                  )
                : Container(
                    child: FutureBuilder<NotificationResponseModel>(
                      future: api.getNotification(controller.text.value),
                      builder: (BuildContext context,
                          AsyncSnapshot<NotificationResponseModel> snapshot) {
                        if (snapshot.hasData) {
                          var response = snapshot.data?.response;
                          // print(response[1].message);
                          // // data.response.length>0?
                          // var response=[];
                          return response.length > 0
                              ? ListView.builder(
                                  itemCount: response.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, int index) {
                                    // print(response[index].notificationid);
                                    // data:response[index]
                                    return NotificationList(
                                        data: response[index]);
                                  },
                                )
                              : Center(child: Text("No Data"));
                        } else if (snapshot.hasError) {
                          return CircularProgressIndicator();

                          //return Text("${snapshot.error}");
                        } else {
                          return CircularProgressIndicator();
                        }

                        // By default, show a loading spinner.
                      },
                    ),
                  ),
            // ListView.builder(
            //                itemCount: 5,
            //                shrinkWrap: true,
            //                physics: ClampingScrollPhysics(),
            //                itemBuilder: (context, int index) {
            //                  return NotificationList();
            //                },
            //              ),
          ],
        ),
      ),
    );
  }

  Widget Header(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .17,
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
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text("Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(
                  height: 17,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * .137,
                  width: MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Student",
                            style: TextStyle(color: kColorGreen),
                          ),

                          Center(
                            child: FutureBuilder(
                              future: getStudents,
                              // ignore: missing_return
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return DropdownButton(
                                    isExpanded: true,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: kColorGreen,
                                    ),
                                    value: _valueChoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _valueChoose = newValue;
                                        print(_valueChoose);
                                      });
                                    },
                                    items: childrens.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem.studentid.toString(),
                                        child: Text(valueItem.studentname),
                                      );
                                    }).toList(),
                                  );
                                } else if (snapshot.hasError) {
                                  // return Text("${snapshot.error}");
                                  return Text("${snapshot.error}");
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            ),
                          )
                          // DropdownButtonFormField(items: items)
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
