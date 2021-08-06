import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/studentdetails.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/paymenthistory.dart';
import 'package:nurture/widget/student.dart';

class StudentList extends StatelessWidget {
  StudentList({Key key, this.data, this.parents, this.childrens})
      : super(key: key);
  StudentResponse data;
  List<ParentResponse> parents;
  List<StudentResponse> childrens;

  // List<Response> data;
  @override
  Widget build(BuildContext context) {
    debugPrint('parent civil id: ${parents[0].civilid}');
    return ListTile(
        leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.pink.shade300,
            backgroundImage: AssetImage("assets/images/chil.png")
            // backgroundImage: AssetImage(img),
            ),
        title: Text(data.studentname),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student Id ${data.studentid}",
              style: TextStyle(fontSize: 11),
            ),
            Text("Al Mina aljadeed", style: TextStyle(fontSize: 11))
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            // print(childrens);
            Get.to(StudentDetails(data: data, parents: parents));
          },
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.green,
          ),
        ),
        onTap: () {
          Get.to(StudentDetails(data: data, parents: parents));
        });
  }
}

class OutstandingPayment extends StatefulWidget {
  OutstandingPayment({Key key, this.txt, this.data}) : super(key: key);
  String txt;
  FeeResponse data;
  @override
  _OutstandingPaymentState createState() => _OutstandingPaymentState();
}

class _OutstandingPaymentState extends State<OutstandingPayment> {
  bool asim = true ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
                    value: asim,
                    onChanged: (value) {
                      setState(() {
                        this.asim = value;
                      });
                    },
                    side: BorderSide(color: Colors.greenAccent),
                    shape: CircleBorder(),
                    activeColor: Colors.greenAccent,
                  ),

      title:
          Text(widget.data.studentname, style: TextStyle(color:asim? Colors.greenAccent:Colors.grey)),
      selected: true,
      horizontalTitleGap: 1,
      trailing: Text(widget.data.dueamount.toString(),
          style: TextStyle(color:asim?Colors.greenAccent: Colors.grey)),
    );
  }
}
/*
class OutstandingPaymentm extends StatelessWidget {
  OutstandingPaymentm({Key key, this.txt, this.data}) : super(key: key);
  String txt;
  FeeResponse data;
  bool asim = true;
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
      title: Text(data.studentname, style: TextStyle(color: Colors.grey)),
      selected: true,
      horizontalTitleGap: 1,
      trailing:
          Text(data.dueamount.toString(), style: TextStyle(color: Colors.grey)),
    );
  }
}
*/
class paymentHistoryList extends StatelessWidget {
  paymentHistoryList({Key key, this.txt, this.data}) : super(key: key);

  String txt;
  PaymentHistoryResponse data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        // height:  MediaQuery.of(context).size.height*.19,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      // height: 99,
                      // width: MediaQuery.of(context).size.width ,
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.,
                          children: [
                            Column(
                              //  mainAxisAlignment:
                              //    MainAxisAlignment.spaceAround,
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
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.knettransactionid,
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data.postdate,
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data.paymentid,
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  data.amount.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: data.result == "Success"
                                        ? kColorGreen
                                        : Colors.red,
                                    //failed?

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
                  Expanded(
                    child: SizedBox(
                      height: 83,
                      width: MediaQuery.of(context).size.width * .22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // failed?
                          Icon(
                            data.result == "Success"
                                ? Icons.check_circle_outline
                                : Icons.cancel_outlined,
                            color: data.result == "Success"
                                ? kColorGreen
                                : Colors.red,
                          ),
                          //:Icon(
                          //Icons.close_rounded,//lose_outlined,
                          //color: Colors.red,
                          // ),
                          Container(
                              height: 20,
                              width: MediaQuery.of(context).size.width * .22,
                              decoration: BoxDecoration(
                                  color: data.result == "Success"
                                      ? Colors.green[50]
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                data.result == "Success"
                                    ? "Download Receipt"
                                    : data.result == "Cancelled"
                                        ? "Cancelled"
                                        : "Failed Transaction",
                                style: TextStyle(
                                    fontSize: 8.5,
                                    color: data.result == "Success"
                                        ? kColorGreen
                                        : Colors.grey),
                              )))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
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

class StudentInfoList extends StatefulWidget {
  StudentInfoList({
    Key key,
    this.data,
    this.parents,
  }) : super(key: key);
  StudentResponse data;
  List<ParentResponse> parents;
  @override
  _StudentInfoListState createState() => _StudentInfoListState();
}

class _StudentInfoListState extends State<StudentInfoList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 18, right: 18, bottom: 10),
            child: Stack(children: [
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
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
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
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.studentname,
                            ),
                            Text("Male"),
                            Text("29/05/2000"),
                            Text("Al Jeel Al Jadeed"),
                            Text("5"),
                            Text("2021-2022"),
                            Text("British"),
                            Text("Muslim"),
                            Text(widget.data.civilid.toString()),
                            Text("30/6/2022"),
                            Text("74K13L57D"),
                            Text("Kuwait")
                          ],
                        ),
                      )
                    ])),
              ),
              Positioned(
                left: 15,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 20,
                    width: 83,
                    color: Colors.white,
                    child: Text(
                      "Student info",
                      style: TextStyle(color: kColorGreen),
                    ),
                  ),
                ),
              ),
            ])),
        ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, int index) {
            // print(studentResponse);
            return Parentlist(widget.parents);
          },
        ),
      ],
    );
  }

  Widget Parentlist(
    List<ParentResponse> data,
  ) {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 18, right: 18, bottom: 10),
            child: Stack(children: [
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
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
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
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("dfd"),
                          Text("Male"),
                          Text("29/05/2000"),
                          Text("Al Jeel Al Jadeed"),
                          Text("5"),
                          Text("2021-2022"),
                          Text("British"),
                          Text("Muslim"),
                          Text("432578"),
                          Text("30/6/2022"),
                          Text("74K13L57D"),
                          Text("Kuwait")
                        ],
                      )
                    ])),
              ),
              Positioned(
                left: 15,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 20,
                    width: 83,
                    color: Colors.white,
                    child: Text(
                      " Mother info",
                      style: TextStyle(color: kColorGreen),
                    ),
                  ),
                ),
              ),
            ])),
      ],
    );
  }

  Widget txt(String txta) {
    return Row(
      children: [
        Text(
          txta,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
/*
class StudentInfoList extends StatelessWidget {
  StudentInfoList({
    Key key,
    this.data,
    this.parents,
  }) : super(key: key);
  StudentResponse data;
  List<ParentResponse> parents;
  // ParentResponse data1;
// List<ParentResponse> parentresponse;

  List<StudentResponse> studentresponse;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 18, right: 18, bottom: 10),
            child: Stack(children: [
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
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
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
                      SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.studentname,
                            ),
                            Text("Male"),
                            Text("29/05/2000"),
                            Text("Al Jeel Al Jadeed"),
                            Text("5"),
                            Text("2021-2022"),
                            Text("British"),
                            Text("Muslim"),
                            Text(data.civilid.toString()),
                            Text("30/6/2022"),
                            Text("74K13L57D"),
                            Text("Kuwait")
                          ],
                        ),
                      )
                    ])),
              ),
              Positioned(
                left: 15,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 20,
                    width: 83,
                    color: Colors.white,
                    child: Text(
                      "Student info",
                      style: TextStyle(color: kColorGreen),
                    ),
                  ),
                ),
              ),
            ])),
       
      ],
    );
  }

 
*/

class ParentsInfoList extends StatelessWidget {
  ParentsInfoList({Key key, this.data}) : super(key: key);
  List<ParentResponse> data;

  @override
  Widget build(BuildContext context) {
    debugPrint('parent civil id: ${data[1].emailid}');
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(top: 25, left: 18, right: 18, bottom: 10),
            child: Stack(children: [
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
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
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
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dfd"),
                          Text("Male"),
                          Text("29/05/2000"),
                          Text("Al Jeel Al Jadeed"),
                          Text("5"),
                          Text("2021-2022"),
                          Text("British"),
                          Text("Muslim"),
                          Text("432578"),
                          Text("30/6/2022"),
                          Text("74K13L57D"),
                          Text("Kuwait")
                        ],
                      )
                    ])),
              ),
              Positioned(
                left: 15,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: 20,
                    width: 83,
                    color: Colors.white,
                    child: Text(
                      " Mother info",
                      style: TextStyle(color: kColorGreen),
                    ),
                  ),
                ),
              ),
            ])),
      ],
    );
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
    return ListTile(
      title: Text("Installment 1"),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  list_txt("Tution", isSelected: true),
                  list_txt("0 KD")
                ],
              ),
            );
          },
        ),
      ]),
    );
  }
}

Widget list_txt(String txt, {bool isSelected = false}) {
  return Text(
    txt,
    style: TextStyle(color: isSelected ? Colors.red : Colors.grey),
  );
}

class paymentList extends StatefulWidget {
  const paymentList({Key key}) : super(key: key);

  @override
  _paymentListState createState() => _paymentListState();
}

class _paymentListState extends State<paymentList> {
  bool enrollment = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Asim Muhammad"),
              Text("300 KD"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: enrollment,
                    onChanged: (value) {
                      setState(() {
                        this.enrollment = value;
                      });
                    },
                    side: BorderSide(color: Colors.green),
                    shape: CircleBorder(),
                    activeColor: Colors.green,
                  ),
                  Text(
                    "  Enrollment",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              Text(
                "100 KD",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Divider(
            color: Colors.grey[200],
          ),
        ],
      ),
      // ],
      // ),
    );
    //  )
    //],
    // ),
    // );
  }
}
