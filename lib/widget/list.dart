import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/studentdetails.dart';

class StudentList extends StatelessWidget {
  StudentList({
    Key key,
    // this.txt,
    // this.data
  }) : super(key: key);
  // String txt;
  // Response data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.pink.shade300,
          // backgroundImage: AssetImage(img),
        ),
        title: Text("Asim Muhammad"),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student Id 849302hjk",
              style: TextStyle(fontSize: 11),
            ),
            Text("Al Mina aljadeed", style: TextStyle(fontSize: 11))
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            Get.to(StudentDetails());
          },
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.green,
          ),
        ));
  }
}

class OutstandingPayment extends StatelessWidget {
  OutstandingPayment({
    Key key,
    // this.txt,
    // this.data
  }) : super(key: key);
  // String txt;
  // Response data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (value) {
          /* setState(() {
                this.asim = value!;
              });*/
        },
        side: BorderSide(color: Colors.green),
        shape: CircleBorder(),
        activeColor: Colors.green,
      ),
      title: Text("Asim Muhammad", style: TextStyle(color: Colors.grey)),
      selected: true,
      horizontalTitleGap: 1,
      trailing: Text("300 KD", style: TextStyle(color: Colors.grey)),
    );
  }
}

class paymentHistoryList extends StatelessWidget {
  paymentHistoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        height: 103,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                    height: 99,
                    width: MediaQuery.of(context).size.width * .65,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Transaction Id",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "DateTime",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Payment Id",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "202117630055787",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "2 jun 2021 at 10:30 am",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "#4542f2m",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "300 KD",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          //failed?
                                          Colors.greenAccent,
                                      //:Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                SizedBox(
                  height: 83,
                  width: MediaQuery.of(context).size.width * .22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // failed?
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.greenAccent,
                      ),
                      //:Icon(
                      //Icons.close_rounded,//lose_outlined,
                      //color: Colors.red,
                      // ),
                      Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * .22,
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Download Receipt",
                            style:
                                TextStyle(fontSize: 8.5, color: Colors.green),
                          )))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
              minVerticalPadding: 3,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Uniform Available"),
              ),
              subtitle: Text(
                  "Lorem ipsumdolor sit amet consetetur sadipsing elitr,sed diam nonumy eirmod tempor invidunt ut")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Divider(),
          )
        ],
      ),
    );
  }
}

class StudentInfoList extends StatelessWidget {
  const StudentInfoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 25, left: 18, right: 18, bottom: 10),
        child: Stack(
          children:[ 
            Align(
              child: Container(
                height: MediaQuery.of(context).size.height * .61,
                  width: MediaQuery.of(context).size.width,
              
              ),
            ),
             Positioned(
              bottom: 0,
               child: Container(
                  height: MediaQuery.of(context).size.height * .60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          txt("Name"),
                          txt("Gender"),
                          txt("Date of Birth"),
                          txt("School Name"),
                          txt("Grade"),
                          txt("Academic Year"),
                          txt("Nationality"),
                          txt("Religion"),
                          txt("Civil id"),
                          txt("Civil idExpiry date"),
                          txt("Passport Number"),
                          txt("Address"),
                        ],
                      ),
                    ),
                   
                  ])
                  ),
             ),
          
          Positioned(
                          left:15,
                          top:0,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              height: 20,
                              width:81,
                              color:Colors.white,
                              child: Text(
                                "Student info",
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                            ),
                          ),
                        ),
           ] ));
  }

  Widget txt(String txta) {
    return Text(
      txta,
      style: TextStyle(color: Colors.grey),
    );
  }
}

class Installment extends StatelessWidget {
  Installment({
    Key key,
    // this.txt,
    // this.data
  }) : super(key: key);
  // String txt;
  // Response data;
  @override
  Widget build(BuildContext context) {
    return
      ListTile(
            title: Text("Installment 1"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, int index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [list_txt("Tution",isSelected: true), list_txt("0 KD")],
                    ),
                );
              },
            ),
          ]


        ),

      );
  }
}

Widget list_txt(String txt, {bool isSelected = false}) {
  return Text(
    txt,
    style: TextStyle(color: isSelected ? Colors.red : Colors.grey),
  );
}


