import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:nurture/model/contact.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/paymentpending.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PaymentPending extends StatefulWidget {
  PaymentPending({Key key}) : super(key: key);
  // List<StudentResponse> childrens = Get.arguments;

  @override
  _PaymentPendingState createState() => _PaymentPendingState();
}

class _PaymentPendingState extends State<PaymentPending> {
  String _valueChoose;
  // value: studentContactRequestModel.studentid,
  // StudentContactRequestModel studentContactRequestModel;
  Api api = new Api();
  Future<PaymentPendingResponseModel> getPayment;
  Future<StudentResponseModel> getStudents;
  List childrens = [];
  PendingDropDown controller = Get.put(PendingDropDown());
  ChildrenController childlistcon = Get.put(ChildrenController());
  double total;
  YearController con = Get.put(YearController());

  @override
  void initState() {
    super.initState();
    total = 0.0;
    childrens = childlistcon.childrenlist;
    // getPayment = api.getPendingPayment(_valueChoose);
    getStudents = api.getStudent().then((student) {
      // childrens = student.response.childrens;
      // print(student.response.childrens);
      // for (int i = 0; i < childrens.length; i++)
      //   print(childrens[i].studentname);
      // print('000');
      setState(() {
        // _valueChoose = childrens[0].studentid.toString();
        controller.text.value = controller.text.value.isEmpty
            ? childrens.length > 0
                ? childrens[0].studentid.toString()
                : controller.text.value
            : controller.text.value;
        print("bvcbb${controller.text.value}");
      });
      getPayment = api.getPendingPayment(_valueChoose);
      return student;
    });
    //studentContactRequestModel = new StudentContactRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    print("sdfsdf${childrens}");
    return Scaffold(
      body: ListView(
        children: [
          // _header(),
          // _installmentSection()
          Stack(
            children: [
              // Container(
              //   height: MediaQuery.of(context).size.height * .20,
              //   width: MediaQuery.of(context).size.width,
              // ),
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
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text("Payment Pending",
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
                                  child: FutureBuilder<StudentResponseModel>(
                                    future: getStudents,
                                    // ignore: missing_return
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Center(
                                            child: Column(children: [
                                          DropdownButton(
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
                                              });
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(
                                                    count: 1,
                                                  ),
                                                ),
                                              );
                                            },
                                            items: childrens.map((valueItem) {
                                              print(
                                                  "sdfsdf${valueItem.studentid}");
                                              return DropdownMenuItem(
                                                value: valueItem.studentid
                                                    .toString(),
                                                child:
                                                    Text(valueItem.studentname),
                                              );
                                            }).toList(),
                                          ),
                                          // Text(
                                          //   'Selected Item = ' + '$_valueChoose',
                                          //   style: TextStyle(
                                          //       fontSize: 22,
                                          //       color: Colors.black),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                        ]));
                                      } else if (snapshot.hasError) {
                                        // return Text("${snapshot.error}");
                                        return Text("${snapshot.error}");
                                      } else {
                                        return Center(
                                          child: SpinKitChasingDots(
                                              color: Colors.blue),
                                        );
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
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Academic year: ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Obx(
                            () => Text(
                              con.year.value ?? "",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                          // height: MediaQuery.of(context).size.height * .70,
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(8),
                          //     border: Border.all(color: Colors.grey.shade300)),
                          /*  child: Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 15, right: 20),*/
                          child: Column(
                            children: [
                              Container(
                                child:
                                    FutureBuilder<PaymentPendingResponseModel>(
                                  future: api
                                      .getPendingPayment(controller.text.value),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<PaymentPendingResponseModel>
                                          snapshot) {
                                    if (snapshot.hasData) {
                                      var statuscode =
                                          snapshot.data?.statuscode;

                                      // print(statuscode);
                                      if (statuscode == "200") {
                                        var response = snapshot.data?.response;
                                        total = 0.0;
                                        for (int index = 0;
                                            index <
                                                    response
                                                        .installment.length ??
                                                0;
                                            index++)
                                          total = total +
                                              response.installment[index]
                                                  .tuitionfee +
                                              response.installment[index]
                                                  .transportfee +
                                              response
                                                  .installment[index].others;
                                        return response.installment.length > 0
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                        color: Colors
                                                            .grey.shade300)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          top: 15,
                                                          right: 20),
                                                  child: Column(
                                                    children: [
                                                      ListView.builder(
                                                        itemCount: response
                                                            .installment.length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        itemBuilder: (context,
                                                            int index) {
                                                          return Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                  'Installment ${index + 1}'),
                                                              Divider(),
                                                              Installment(
                                                                  data: response
                                                                          .installment[
                                                                      index]),
                                                              SizedBox(
                                                                height: 15,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Total",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${total}",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 3,
                                                                vertical: 10),
                                                        child: Divider(),
                                                      ),
                                                      SizedBox(height: 20),
                                                      Center(
                                                        child: Spinner(
                                                          child: payNowButtons([
                                                            {
                                                              "AcademicPeriodId":
                                                                  "2020-2021",
                                                              "GrandTotal":
                                                                  total,
                                                              "IsIncludeEnrollment":
                                                                  false,
                                                              "KnetpaymentAmount":
                                                                  total,
                                                              "OffSet": -330,
                                                              "OpeningBalance":
                                                                  0,
                                                              "StudentId":
                                                                  controller
                                                                      .text
                                                                      .value,
                                                              "Paymentid": 0
                                                            }
                                                          ], context),
                                                        ),
                                                      ),
                                                      SizedBox(height: 20)
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Center(child: Text("No Data"));
                                      } else {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .70,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text("No Data Found")),
                                        );
                                      }
                                    } else if (snapshot.hasError) {
                                      // return Text("${snapshot.error}");
                                      return Text("${snapshot.error}");
                                    } else {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .50,
                                        child: Center(
                                            child: SpinKitWave(
                                          color: Colors.blue,
                                        )),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          )),
                      // ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
