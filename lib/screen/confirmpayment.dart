import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/widget/actions.dart';

class ConfirmPayment extends StatefulWidget {
  ConfirmPayment({Key key}) : super(key: key);
  List childrens = Get.arguments;

  @override
  _ConfirmPaymentState createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  double total = 0.0;
  List<bool> enrollment;
  List<Abcd> paymentlist = [];
  var x;
  void initState() {
    super.initState();
    enrollment = List<bool>.filled(widget.childrens.length, false);
  }

  List<Map<String, dynamic>> convert() {
    return paymentlist.map((e) => e.toMap()).toList();
  }

  addPaymentlist({int sid1 = 2920, double total = 100.0, int index1, int i}) {
    // x = paymentlist.map((e) => e.index).toList();
    // var i = x.indexOf(index1);
    setState(
      () {
        if (i == 1) {
          paymentlist.add(
            Abcd(total: total, sid: sid1),
          );
        } else {
          paymentlist.removeAt(index1);
          // paymentlist[index1] = Abcd(total: total, sid: sid1);
        }
      },
    );
    // print(x.length);
    print(paymentlist.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        title: Text("Confirm Payment",
            style: TextStyle(
              color: Colors.white,
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff43CEA2),
                Color(0xff279DD4),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .54,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[200])),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Student", style: TextStyle(color: Colors.grey)),
                          Text("Amount", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      ListView.builder(
                        itemCount: widget.childrens.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          print(widget.childrens[index].studentname);
                          total = total + widget.childrens[index].dueamount;
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10, top: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(widget.childrens[index].studentname),
                                    Text(
                                      widget.childrens[index].dueamount
                                          .toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: enrollment[index],
                                          onChanged: (value) {
                                            setState(() {
                                              this.enrollment[index] = value;
                                              if (value == true) {
                                                addPaymentlist(
                                                    i: 1,
                                                    total: total,
                                                    index1: index
                                                    // sid1: widget
                                                    //     .childrens[index]
                                                    //     .studentname
                                                    );
                                              } else {
                                                addPaymentlist(
                                                    i: 0,
                                                    total: total,
                                                    index1: index
                                                    // sid1: widget
                                                    //     .childrens[index]
                                                    //     .studentname
                                                    );
                                              }
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
                          );
                          // paymentList(
                          //   data: widget.childrens[index],
                          // );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Padding(
            //  padding: const EdgeInsets.all(8.0),
            //  child:
            Center(
              child:
                  Text("Add enrollment fee for confirming next academic year",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      )),
            ),
            // ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount"),
                Text(
                  "${total} KD",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: kColorGreen),
                child: Center(
                    child: Text(
                  "Confirm Payment",
                  style: TextStyle(color: Colors.white),
                )),
              ),
              onTap: () async {
                var lists = await convert();
                var data = await submitConfirmPayment(lists);
                // print(data);
              },
            ),
            // confirmButtons(),
            SizedBox(
              height: 5,
            ),
            SizedBox(
                height: 40,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Confirming payment will take you",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "to payment gateway",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class Abcd {
  double total;
  int sid;
  int index;
  Abcd({this.total, this.sid, this.index});
  Map<String, dynamic> toMap() => {
        "AcademicPeriodId": "2020-2021",
        "GrandTotal": 2402,
        "IsIncludeEnrollment": false,
        "KnetpaymentAmount": 2402,
        "OffSet": 330,
        "OpeningBalance": 0,
        "StudentId": 2920,
        "Paymentid": 0
      };
}
