import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
//import 'package:nurture/model/contact.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/feestructure.dart';
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
  Future<FeeStructureModel> getFeeStructure;
  YearController con = Get.put(YearController());

  @override
  void initState() {
    super.initState();
    getFeeStructure = api.getFeeStructure().then((feestructure) {
      return feestructure;
    });
    //studentContactRequestModel = new StudentContactRequestModel();
  }

  @override
  Widget build(BuildContext context) {
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
                      Text("Payment_pending".tr,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        height: 17,
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Academic_Year".tr+":",
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
                                child: FutureBuilder<FeeStructureModel>(
                                  future: api.getFeeStructure(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<FeeStructureModel>
                                      snapshot) {
                                    if (snapshot.hasData) {
                                      var statuscode =
                                          snapshot.data?.statuscode;
                                      // print(statuscode);
                                      if (statuscode == "200") {

                                        var response = snapshot.data?.response;
                                        print(response.length);
                                            return response.length>0?  ListView.builder(
                                                itemCount: response.length,
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
                                                                response[index].studentname),
                                                      Divider(),
                                                      Container(
                                                        child:ListView.builder(
                                                          itemCount: response[index].installment.length,
                                                          shrinkWrap: true,
                                                          physics:
                                                          ClampingScrollPhysics(),
                                                          itemBuilder: (context, int i) {
                                                            print(response[index].installment[i]);
                                                            return Column(
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                      'Installment ${i +
                                                                          1}'),

                                                                  Installment(
                                                                  data: response[index].installment[i]
                                                                  ),
                                                                ]
                                                              );
                                                            }
                                                          ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Total Due",
                                                            style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${response[index].dueamount} KD",
                                                            style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Due Now",
                                                            style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${response[index].duenow} KD",
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
                                                        // child: Divider(),
                                                      ),
                                                      SizedBox(height: 20),
                                                    ],

                                                  );
                                                })
                                            : Center(
                                            child:
                                            Text("No Pending Payment"));
                                      } else {

                                        return Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .70,
                                          width:
                                          MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text("No_Data_Found".tr)),
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
                                //     FutureBuilder<PaymentPendingResponseModel>(
                                //   future: api
                                //       .getPendingPayment(controller.text.value),
                                //   builder: (BuildContext context,
                                //       AsyncSnapshot<PaymentPendingResponseModel>
                                //           snapshot) {
                                //     if (snapshot.hasData) {
                                //       var statuscode =
                                //           snapshot.data?.statuscode;
                                //
                                //       // print(statuscode);
                                //       if (statuscode == "200") {
                                //
                                //         var response = snapshot.data?.response;
                                //         total = 0.0;
                                //
                                //         for (int index = 0;
                                //             index <
                                //                     response
                                //                         .installment.length ??
                                //                 0;
                                //             index++)
                                //           total = total +
                                //               response.installment[index]
                                //                   .tuitionfee +
                                //               response.installment[index]
                                //                   .transportfee +
                                //               response
                                //                   .installment[index].others;
                                //
                                //         // return response.installment.length > 0
                                //         return response.installment.length > 0
                                //             //response.dueamount!=0.0
                                //             ? Container(
                                //                 width: MediaQuery.of(context)
                                //                     .size
                                //                     .width,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                             8),
                                //                     border: Border.all(
                                //                         color: Colors
                                //                             .grey.shade300)),
                                //                 child: Padding(
                                //                   padding:
                                //                       const EdgeInsets.only(
                                //                           left: 15,
                                //                           top: 15,
                                //                           right: 20),
                                //                   child: Column(
                                //                     children: [
                                //                       ListView.builder(
                                //                           itemCount: response
                                //                               .installment
                                //                               .length,
                                //                           shrinkWrap: true,
                                //                           physics:
                                //                               ClampingScrollPhysics(),
                                //                           itemBuilder: (context,
                                //                               int index) {
                                //                             // if (response
                                //                             //             .installment[
                                //                             //                 index]
                                //                             //             .tuitionfee +
                                //                             //         response
                                //                             //             .installment[
                                //                             //                 index]
                                //                             //             .transportfee +
                                //                             //         response
                                //                             //             .installment[
                                //                             //                 index]
                                //                             //             .others ==
                                //                             //     0.0)
                                //                             /* if(response.dueamount==0.0)
                                //                           {
                                //                             return SizedBox();
                                //                           } else { */
                                //                            /*  return
                                //                             Column(
                                //                               crossAxisAlignment:
                                //                                   CrossAxisAlignment
                                //                                       .start,
                                //                               children: [
                                //                                 Text(
                                //                                     'Installment ${response
                                //                                         .installment[
                                //                                     index].id}'),
                                //                                 Divider(),
                                //                                 Installment(
                                //                                     data: response
                                //                                             .installment[
                                //                                         index]),
                                //                                 SizedBox(
                                //                                   height: 15,
                                //                                 ),
                                //                               ],
                                //                             );
                                //
                                //                           }),*/
                                //
                                //                             return Column(
                                //                               crossAxisAlignment:
                                //                                   CrossAxisAlignment
                                //                                       .start,
                                //                               children: [
                                //                                 Text(
                                //                                     'Installment ${index + 1}'),
                                //                                 Divider(),
                                //                                 //  if(){},
                                //                                 Installment(
                                //                                     data: response
                                //                                             .installment[
                                //                                         index]),
                                //                                 SizedBox(
                                //                                   height: 15,
                                //                                 ),
                                //                               ],
                                //                             );
                                //                           }),
                                //                       Divider(),
                                //                       Row(
                                //                         mainAxisAlignment:
                                //                             MainAxisAlignment
                                //                                 .spaceBetween,
                                //                         children: [
                                //                           Text(
                                //                             "Total Due",
                                //                             style: TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold,
                                //                             ),
                                //                           ),
                                //                           Text(
                                //                             "${total} KD",
                                //                             style: TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight
                                //                                       .bold,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       Divider(),
                                //                       Row(
                                //                         mainAxisAlignment:
                                //                         MainAxisAlignment
                                //                             .spaceBetween,
                                //                         children: [
                                //                           Text(
                                //                             "Due Now",
                                //                             style: TextStyle(
                                //                               fontWeight:
                                //                               FontWeight
                                //                                   .bold,
                                //                             ),
                                //                           ),
                                //                           Text(
                                //                             "${response.duenow} KD",
                                //                             style: TextStyle(
                                //                               fontWeight:
                                //                               FontWeight
                                //                                   .bold,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       Padding(
                                //                         padding: EdgeInsets
                                //                             .symmetric(
                                //                                 horizontal: 3,
                                //                                 vertical: 10),
                                //                         // child: Divider(),
                                //                       ),
                                //                       SizedBox(height: 20),
                                //                       /*Center(
                                //                           child: Spinner(
                                //                         child: payNowButtons([
                                //                           {
                                //                             "AcademicPeriodId":
                                //                                 "2020-2021",
                                //                             "GrandTotal": total,
                                //                             "IsIncludeEnrollment":
                                //                                 false,
                                //                             "KnetpaymentAmount":
                                //                                 total,
                                //                             "OffSet": -330,
                                //                             "OpeningBalance": 0,
                                //                             "StudentId":
                                //                                 controller
                                //                                     .text.value,
                                //                             "Paymentid": 0,
                                //                           }
                                //                         ], context, total
                                //                         ),
                                //                       )),*/
                                //                       SizedBox(height: 20)
                                //                     ],
                                //                   ),
                                //                 ),
                                //               )
                                //             : Center(
                                //                 child:
                                //                     Text("No Pending Payment"));
                                //       } else {
                                //
                                //         return Container(
                                //           height: MediaQuery.of(context)
                                //                   .size
                                //                   .height *
                                //               .70,
                                //           width:
                                //               MediaQuery.of(context).size.width,
                                //           child: Center(
                                //               child: Text("No_Data_Found".tr)),
                                //         );
                                //       }
                                //     } else if (snapshot.hasError) {
                                //       // return Text("${snapshot.error}");
                                //       return Text("${snapshot.error}");
                                //     } else {
                                //       return Container(
                                //         width:
                                //             MediaQuery.of(context).size.width,
                                //         height:
                                //             MediaQuery.of(context).size.height *
                                //                 .50,
                                //         child: Center(
                                //             child: SpinKitWave(
                                //           color: Colors.blue,
                                //         )),
                                //       );
                                //     }
                                //   },
                                // ),
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
