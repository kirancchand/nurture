import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/model/payment.dart';
import 'package:nurture/screen/PaymentWebPage.dart';
import 'package:nurture/widget/actions.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/localization.dart';
class ConfirmPayment extends StatefulWidget {
  ConfirmPayment({Key key}) : super(key: key);
  List childrens = Get.arguments[0];
  double total = Get.arguments[1];
  @override
  _ConfirmPaymentState createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  // double total = 0.0;
  List<bool> enrollment;
  List<Abcd> paymentlist = [];
  var x;
  void initState() {
    super.initState();
    enrollment = List<bool>.filled(widget.childrens.length, false);
    YearController con = Get.put(YearController());
    print("reaar${con.year.value}");
  }

  List<Map<String, dynamic>> convert() {
    return paymentlist.map((e) => e.toMap()).toList();
  }

  String selectedLang=(Get.locale.toString() == "en_US")?"en_US":"ar_AB";

  addPaymentlist({int sid1, double total, bool isEnroll}) {
    // x = paymentlist.map((e) => e.index).toList();
    // var i = x.indexOf(index1);
    setState(() {
      paymentlist.add(
        Abcd(
          total: total,
          sid: sid1,
          isEnroll: isEnroll,
        ),
      );
    });
    // print(x.length);
    // print(paymentlist.length);
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.childrens[0].studentname);
    return Spinner(
      child: Scaffold(
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
              selectedLang== "en_US"?Icons.keyboard_arrow_left:Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
            iconSize: 36,
          ),
          toolbarHeight: 80,
          title: Text("Confirm_payment".tr,
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
                // height: MediaQuery.of(context).size.height * .54,
                //  width: MediaQuery.of(context).size.width,
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
                            Text("Student".tr,
                                style: TextStyle(color: Colors.grey)),
                            Text("Amount".tr,
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        ListView.builder(
                          itemCount: widget.childrens.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            // print(widget.childrens[index].studentname);

                            return Padding(
                              padding: EdgeInsets.only(bottom: 10, top: 15),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                            selectedLang== "en_US"?widget.childrens[index].studentname:widget.childrens[index].arabstudentname,
                                      )),
                                      Text(
                                        widget.childrens[index].dueamount
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  widget.childrens[index].enrollmentamount ==
                                          0.0
                                      ? Container()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                // ignore: unrelated_type_equality_checks
                                                Checkbox(
                                                  value: enrollment[index],
                                                  onChanged: (value) {
                                                   // print("asdasda${widget.total}");
                                                    setState(() {
                                                      enrollment[index] = value;
                                                      if (value == true) {
                                                        widget.total = widget
                                                                .total +
                                                            widget
                                                                .childrens[
                                                                    index]
                                                                .enrollmentamount;
                                                      } else {
                                                        widget.total = widget
                                                                .total -
                                                            widget
                                                                .childrens[
                                                                    index]
                                                                .enrollmentamount;
                                                      }
                                                    });
                                                  },
                                                  side: BorderSide(
                                                      color: Colors.green),
                                                  shape: CircleBorder(),
                                                  activeColor: Colors.green,
                                                ),
                                                Text(
                                                  "  Enrollment".tr,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              // widget.childrens[index].,
                                              widget.childrens[index]
                                                      .enrollmentamount
                                                      .toString() ??
                                                  '',
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                    Text("Add_enrollment_fee_for_confirming_next_academic_year".tr,
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
                  Text("Total_amount".tr),
                  Text(
                    "${widget.total} KD",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              widget.total > 0
                  ? GestureDetector(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kColorGreen),
                        child: Center(
                            child: Text(
                          "Confirm_payment".tr,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      onTap: () async {
                        // print(enrollment);
                        for (int i = 0; i < widget.childrens.length; i++) {
                          addPaymentlist(
                            isEnroll: enrollment[i],
                            total: widget.total,
                            // total: enrollment[i] == false
                            //     ? widget.childrens[i].dueamount
                            //     : widget.childrens[i].dueamount +
                            //         widget.childrens[i].enrollmentamount,
                            sid1: widget.childrens[i].studentid,
                          );
                        }
                        var lists = await convert();
                        //print(lists);
                        showSpinner();
                        Payment data = await submitConfirmPayment(lists);
                        hideSpinner();

                        Get.offAll(()=>PaymentWebPage(link: data.response ?? ""));
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PaymentWebPage(
                        //       link: data.response ?? "",
                        //     ),
                        //   ),
                        // );
                        //print(data);
                      },
                    )
                  : GestureDetector(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: kColorGreen),
                        child: Center(
                            child: Text(
                          "Confirm_payment".tr,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      onTap: () async {
                        Fluttertoast.showToast(
                            msg: 'You did not have any Payments Pending');
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
                        "Confirming_payment_will_take_you_to_payment_gateway".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                     // Text(
                     //   "to payment gateway",
                     //   style: TextStyle(color: Colors.grey),
                     // ),
                    ],
                  )),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class Abcd {
  double total;
  int sid;
  int index;
  bool isEnroll;

  Abcd({
    this.total,
    this.sid,
    this.index,
    this.isEnroll,
  });
  YearController con = Get.put(YearController());
  Map<String, dynamic> toMap() => {
        "AcademicPeriodId": con.year.value,
        "GrandTotal": total,
        "IsIncludeEnrollment": isEnroll,
        "KnetpaymentAmount": total,
        "OffSet": 330,
        "OpeningBalance": 0,
        "StudentId": sid,
        "Paymentid": 0
      };
}
