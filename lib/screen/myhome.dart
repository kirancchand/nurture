import 'dart:convert';

import 'package:flutter/material.dart';
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
 var mydata= [
              {
              "studentid": 2920,
              "studentnumber": "EA-S-00006205",
              "userid": 2107,
              "birthdate": "1900-01-01T00:00:00",
              "isguardian": false,
              "gender": "F",
              "contactphonenumber": null,
              "contactmobilenumber": null,
              "contactemailid": null,
              "createdby": 2107,
              "createdon": "2021-04-19T07:09:48.7",
              "updatedby": 2107,
              "updatedon": "2021-04-19T07:09:48.7",
              "civilid": "307062702055",
              "countryid": 272,
              "passportnumber": "",
              "addressline1": "",
              "addressline2": null,
              "regionalarea": "Other Country",
              "gradeid": 217,
              "schoolid": 5637145327,
              "isfather": null,
              "ismother": null,
              "issameforaddress": false,
              "studentname": "Rawan Ahmed Nabil Abdelmoghny Mohamed",
              "arabstudentname": "روان احمد نبيل عبدالمغني محمد",
              "isprimarycontact": "Father",
              "uniformfee": 0.0,
              "religion": "",
              "studntcode": null,
              "grade": null
              },
              {
              "studentid": 10164,
              "studentnumber": "EA-S-00006222",
              "userid": 2107,
              "birthdate": "1900-01-01T00:00:00",
              "isguardian": false,
              "gender": "F",
              "contactphonenumber": null,
              "contactmobilenumber": null,
              "contactemailid": null,
              "createdby": 2107,
              "createdon": "2021-06-10T09:09:45.587",
              "updatedby": 2107,
              "updatedon": "2021-06-10T09:09:45.587",
              "civilid": "310090302056",
              "countryid": 91,
              "passportnumber": "",
              "addressline1": "",
              "addressline2": null,
              "regionalarea": "Kuwait",
              "gradeid": null,
              "schoolid": 5637145327,
              "isfather": null,
              "ismother": null,
              "issameforaddress": false,
              "studentname": "Mahmoud Ahmed Nabil Abdelmoghny Mohamed",
              "arabstudentname": "محمود احمد نبيل عبدالمغني محمد",
              "isprimarycontact": "Father",
              "uniformfee": 0.0,
              "religion": "",
              "studntcode": null,
              "grade": null
              },
              {
              "studentid": 11761,
              "studentnumber": "EA-S-00006689",
              "userid": 2107,
              "birthdate": "1900-01-01T00:00:00",
              "isguardian": false,
              "gender": "F",
              "contactphonenumber": null,
              "contactmobilenumber": null,
              "contactemailid": null,
              "createdby": 2107,
              "createdon": "2021-06-10T09:21:47.027",
              "updatedby": 2107,
              "updatedon": "2021-06-10T09:21:47.027",
              "civilid": "125478965412",
              "countryid": 91,
              "passportnumber": "",
              "addressline1": "",
              "addressline2": null,
              "regionalarea": "Kuwait",
              "gradeid": null,
              "schoolid": 5637145327,
              "isfather": null,
              "ismother": null,
              "issameforaddress": false,
              "studentname": "MHMOUD A N MOHAMED",
              "arabstudentname": "محمود احمد نبيل عبدالمغني محمد",
              "isprimarycontact": "Father",
              "uniformfee": 0.0,
              "religion": "",
              "studntcode": null,
              "grade": null
              }
              ];
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
                Text(
                  "Muhammad Nabil",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text("Parent ID: 538939nks52",
                    style: TextStyle(
                      color: Colors.white,
                    )),
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
                                    future: api.getStudent(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<StudentResponseModel> snapshot) {
                                      if (snapshot.hasData) {
                                        var response=snapshot.data?.response;

                                        print("fsdfd");
                                        print(response);
                                        // // data.response.length>0?
                                        // var response=[];
                                        return response.childrens.length>0?ListView.builder(
                                          itemCount: response.childrens.length,
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          itemBuilder: (context, int index) {
                                            // print(response[index].studentname);
                                            // data:response[index]
                                            return StudentList(data:response.childrens[index]);
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

                  print("fsdfd");
                  // print(data[0]);
                  // // data.response.length>0?
                  // var response=[];
                  return response.length>0?ListView.builder(
                    itemCount: response.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, int index) {
                      print(response[index].studentname);
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
          Get.toNamed('/contactinformation');
        });
  }
}
