import 'package:flutter/material.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/notification.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/widget/list.dart';

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
        _valueChoose = childrens[0].studentid.toString();
      });

      return student;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          Container(
            child: FutureBuilder<NotificationResponseModel>(
              future: api.getNotification(_valueChoose),
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
                            // data:response[index]
                            return NotificationList(data: response[index]);
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
    );
  }

  Widget Header() {
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
