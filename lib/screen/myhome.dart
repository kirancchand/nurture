import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/confirmpayment.dart';
import 'package:nurture/screen/contactinformation.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/widget/student.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/service/api.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Api api = new Api();
  Future<StudentResponseModel> getStudents;
  String parentName;
  List childrens=[];
  @override
  void initState() {
    super.initState();
    getStudents = api.getStudent().then((student){
      childrens=student.response.childrens;
      return student;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      body: SafeArea(
        child: ListView(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          // mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                   backgroundImage:AssetImage("assets/images/arabian-vector-icon-260nw-445427119.png")
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child:FutureBuilder<StudentResponseModel>(
                    future: getStudents,
                    builder: (BuildContext context,
                        AsyncSnapshot<StudentResponseModel> snapshot) {
                      if (snapshot.hasData) {
                        var response=snapshot.data?.response;

                        // // data.response.length>0?
                        // var response=[];
                        return response.parents.length>0?Column(
                          children:[
                            Stack(
                              children:[
                                Text(
                                  response.parents[0].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]
                          ),
                            Stack(
                                children:[
                                  Text("Parent ID: ${response.parents[0].parentdetailsid}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ]
                            )
                         ]
                        )
                        :Center(child:Text("No Data"));

                      } else if (snapshot.hasError) {
                        // return Text("${snapshot.error}");
                        return Text("${snapshot.error}");
                      }
                      else
                      {
                        return CircularProgressIndicator();
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Students"),
                                    Text(
                                      "Academic year: 2021-2022",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 11),
                                    )
                                  ],
                                ),
                              ),
                              Container(

                                  child:FutureBuilder<StudentResponseModel>(
                                    future: getStudents,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<StudentResponseModel> snapshot) {
                                      if (snapshot.hasData) {
                                        var response=snapshot.data?.response;

                                        // // data.response.length>0?
                                        // var response=[];
                                        return response.childrens.length>0?ListView.builder(
                                          itemCount: response.childrens.length,
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          itemBuilder: (context, int index) {
                                            // print(response[index].studentname);
                                            // data:response[index]
                                            return StudentList(data:response.childrens[index],parents:response.parents,childrens:response.childrens);
                                          },
                                        ):Center(child:Text("No Data"));

                                      } else if (snapshot.hasError) {
                                        // return Text("${snapshot.error}");
                                        return Text("${snapshot.error}");
                                      }
                                      else
                                      {
                                        return CircularProgressIndicator();
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
                            ]))),
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
    );
  }

  Widget OutStandingSection() {
    double total=0.0;
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

            child:FutureBuilder<FeeResponseModel>(
              future: api.getFee(),
              builder: (BuildContext context,
                  AsyncSnapshot<FeeResponseModel> snapshot) {
                if (snapshot.hasData) {
                  var response=snapshot.data?.response;


                  // print(data[0]);
                  // // data.response.length>0?
                  // var response=[];
                  return response.length>0?ListView.builder(
                    itemCount: response.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, int index) {
                      print(response);
                      total=total+response[index].dueamount;
                      return OutstandingPayment(data:response[index]);
                    },
                  ):Center(child:Text("No Data"));

                } else if (snapshot.hasError) {
                  // return Text("${snapshot.error}");
                  return Text("${snapshot.error}");
                }
                else
                {
                  return CircularProgressIndicator();
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
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Total"), Text(total.toString()+"KD")],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(ConfirmPayment());
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
        ],
      ),
    );
  }

  Widget ContactUs() {
    return GestureDetector(
        child: Container(
            height: 45,
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
          Get.toNamed('/contactinformation',arguments:childrens);
        });
  }
}
