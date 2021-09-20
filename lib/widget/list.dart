import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import 'package:nurture/common/constants.dart';
import 'package:nurture/model/fee.dart';
import 'package:nurture/model/notification.dart';
import 'package:nurture/model/paymenthistory.dart';
// import 'package:nurture/model/paymentpending.dart';
import 'package:nurture/model/feestructure.dart';
import 'package:nurture/model/student.dart';

import 'package:nurture/screen/studentdetails.dart';
import 'package:nurture/service/api.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:nurture/screen/ReceiptView.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:nurture/screen/Pdf.dart';
import 'package:nurture/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
class StudentList extends StatefulWidget {
  StudentList({Key key, this.data}) : super(key: key);
  FeeResponse data;

  @override
  _StudentListState createState() => _StudentListState();

}

class _StudentListState extends State<StudentList> {
  // List<Response> data;
  String selectedLang=(Get.locale.toString() == "en_US")?"en_US":"ar_AB";
  @override
  void initState() {
    super.initState();
    // Future<void> langFunc() async {
    //   var pref = await SharedPreferences.getInstance();
    //   print("list${pref.getString('lang')}");
    //   setState(() {
    //     selectedLang = pref.getString('lang');
    //   });
    // }
    // langFunc();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('parent civil id: ${parents[0].civilid}');
    print(Get.locale);
    return GestureDetector(
      child: ListTile(
          leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.pink.shade300,
              backgroundImage: AssetImage("assets/images/chil.png")
              // backgroundImage: AssetImage(img),
              ),
          title: Text( selectedLang== "en_US"?widget.data.studentname:widget.data.arabstudentname),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Student_id".tr+" "+"${widget.data.studentnumber}" ?? "",
                style: TextStyle(fontSize: 11),
              ),
              Text(widget.data.schoolname ?? "", style: TextStyle(fontSize: 11))
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              // print(childrens);
              Get.to(StudentDetails(data: widget.data));
            },
            icon: Icon(
              selectedLang== "en_US"?Icons.keyboard_arrow_right:Icons.keyboard_arrow_left,
              color: Colors.green,
            ),
          ),
          onTap: () {
            Get.to(StudentDetails(data: widget.data));
          }),
    );
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
  bool selectedStudent = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: selectedStudent,
        onChanged: (value) {
          setState(() {
            this.selectedStudent = value;
          });
        },
        side: BorderSide(color: kColorGreen),
        shape: CircleBorder(),
        activeColor: kColorGreen,
      ),
      title: Text(widget.data.studentname,
          style: TextStyle(color: selectedStudent ? kColorGreen : Colors.grey)),
      selected: true,
      horizontalTitleGap: 1,
      trailing: Text(widget.data.dueamount.toString(),
          style: TextStyle(color: selectedStudent ? kColorGreen : Colors.grey)),
    );
  }
}

class paymentHistoryList extends StatefulWidget {
  paymentHistoryList({Key key, this.txt, this.data}) : super(key: key);

  String txt;
  PaymentHistoryResponse data;
  @override
  _PaymentHistoryListState createState() => _PaymentHistoryListState();
}

class _PaymentHistoryListState extends State<paymentHistoryList> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;

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
          child: Center(
            child: loading
                ? Container(
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: progress,
                      color: Colors.blue,
                    ),
                  )
                : Padding(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Transaction_id".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Date/Time".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Payment_id".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "Amount".tr,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.data.knettransactionid,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            widget.data.postdate,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            widget.data.paymentid,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            widget.data.amount.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: widget.data.result ==
                                                      "Success"
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // failed?
                                    Icon(
                                      widget.data.result == "Success"
                                          ? Icons.check_circle_outline
                                          : Icons.cancel_outlined,
                                      color: widget.data.result == "Success"
                                          ? kColorGreen
                                          : Colors.red,
                                    ),
                                    //:Icon(
                                    //Icons.close_rounded,//lose_outlined,
                                    //color: Colors.red,
                                    // ),
                                    GestureDetector(
                                      child: Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .22,
                                        decoration: BoxDecoration(
                                            color:
                                                widget.data.result == "Success"
                                                    ? Colors.green[50]
                                                    : Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          widget.data.result == "Success"
                                              ? "Download_receipt".tr
                                              : widget.data.result ==
                                                      "Cancelled"
                                                  ? "Cancelled".tr
                                                  : "Failed_transaction".tr,
                                          style: TextStyle(
                                              fontSize: 8.5,
                                              color: widget.data.result ==
                                                      "Success"
                                                  ? kColorGreen
                                                  : Colors.grey),
                                        )),
                                      ),
                                      onTap: () {
                                        // Center(
                                        //   child: loading
                                        //       ? Container(
                                        //           child: LinearProgressIndicator(
                                        //             minHeight: 10,
                                        //             value: progress,
                                        //             color:Colors.blue,
                                        //           ),
                                        //         )
                                        //       : Container(),
                                        // );
                                        // widget.data.result=="Success"?Get.toNamed('/download',arguments: [widget.data.paymentid,widget.data.filepath]):Container();
                                        widget.data.result == "Success"
                                            ? widget.data.filepath == null
                                                ? Fluttertoast.showToast(
                                                    msg:
                                                        "Receipt will be available to download soon!!")
                                                : showPdfView(
                                                    widget.data.paymentid,
                                                    widget.data.filepath)
                                            // ? widget.data.filepath==null?Fluttertoast.showToast(msg: "Please wait for verify your payment!!"):downloadFile(widget.data.paymentid,
                                            //     widget.data.filepath)
                                            : Container();

                                        // Navigator.of(context).push(MaterialPageRoute(builder:( context)=>ModelDownload()));
                                      },
                                    )
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
        ));
  }

  showPdfView(paymentid, filepath) async {
    // downloadFile(paymentid, filepath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(link: filepath),
      ),
    );
    // Get.to(()=>ReceiptView(link: filepath ?? ""));
  }

  downloadFile(paymentid, filepath) async {
    //print("sdfsd${paymentid}");
    //print("filepath ${filepath}");
    setState(() {
      loading = true;
      progress = 0;
    });
    // print(loading);
    bool downloaded = await savePaymentFile(filepath, "${paymentid}.pdf");
    if (downloaded) {
      Fluttertoast.showToast(msg: "File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  Future<bool> savePaymentFile(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          //   print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/medrasaty";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}

class NotificationList extends StatelessWidget {
  NotificationList({Key key, this.data}) : super(key: key);
  NotificationResponse data;
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
                child: Text(data.subject.toString()),
              ),
              subtitle: Text(data.message.toString())),
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
  }) : super(key: key);
  FeeResponse data;
  @override
  _StudentInfoListState createState() => _StudentInfoListState();
}

class _StudentInfoListState extends State<StudentInfoList> {
  List<ParentResponse> parents;
  StudentResponse childrens;

  Api api = new Api();
  Future<StudentResponseModel> getStudents;
  String selectedLang=(Get.locale.toString() == "en_US")?"en_US":"ar_AB";

  @override
  void initState() {
    // super.initState();
    // print(widget.data.studentid);
    getStudents = api.getStudentByid(widget.data.studentid).then((student) {
      parents = student.response.parents;
      for (var i = 0; i < student.response.childrens.length; i++) {
        if (student.response.childrens[i].studentid == widget.data.studentid) {
          childrens = student.response.childrens[i];
        }
      }
      return student;
    });

    // getStudents = api.getStudent().then((student) {
    //   parents = student.response.parents;
    //   for (var i = 0; i < student.response.childrens.length; i++) {
    //     if (student.response.childrens[i].studentid == widget.data.studentid) {
    //       childrens = student.response.childrens[i];
    //     }
    //   }
    //   return student;
    // });
    // Future<void> langFunc() async {
    //   var pref = await SharedPreferences.getInstance();
    //   print("adasdas${pref.getString('lang')}");
    //   setState(() {
    //     selectedLang = pref.getString('lang');
    //   });
    // }
    // langFunc();
  }



  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(right: 20, left: 20, top: 20),
      child: FutureBuilder<StudentResponseModel>(
        future: getStudents,
        builder: (BuildContext context,
            AsyncSnapshot<StudentResponseModel> snapshot) {
          if (snapshot.hasData) {
            print("ddfdf${selectedLang}");
            print(childrens.studentname);
            var response = snapshot.data?.response;
            return ListView(
              children: [
                Stack(
                  children: [
                    Align(
                      child: Container(
                        height: MediaQuery.of(context).size.height * .61,
                        width: MediaQuery.of(context).size.width - 40,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                          height: MediaQuery.of(context).size.height * .60,
                          width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 200, child: txt("Name".tr)),
                                    Expanded(
                                        child: Text(
                                          selectedLang == "en_US"?childrens.studentname:childrens.arabstudentname,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Gender".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.gender,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Date_of_Birth".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.birthdate.day.toString() +
                                          "/" +
                                          childrens.birthdate.month.toString() +
                                          "/" +
                                          childrens.birthdate.year.toString(),
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("School_Name".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.schoolname,
                                      maxLines: 3,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Grade".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.grade,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Academic_Year".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.academicyear,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Nationality".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.nationality,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Religion".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.religion,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Civil_ID".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.civilid.toString(),
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Civil_id_Expiry_Date".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.studentcivilexpirydate.day
                                              .toString() +
                                          "/" +
                                          childrens.studentcivilexpirydate.month
                                              .toString() +
                                          "/" +
                                          childrens.studentcivilexpirydate.year
                                              .toString(),
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Passport_Number".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.passportnumber,
                                      maxLines: 2,
                                    ))
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: txt("Address".tr),
                                    ),
                                    Expanded(
                                        child: Text(
                                      childrens.regionalarea,
                                      maxLines: 10,
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      left: 15,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
                          height: 20,
                          width: 83,
                          color: Colors.white,
                          child: Text(
                            "Student_Info".tr,
                            style: TextStyle(color: kColorGreen),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: response.parents.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int index) {
                    return Parentlist(parents, index);
                  },
                ),
              ],
            );
          } else if (snapshot.hasError) {
            // return Text("${snapshot.error}");
            return Text("${snapshot.error}");
          } else {
            return Center(
                child: SpinKitWave(
              color: Colors.blue,
            ));
          }

          // By default, show a loading spinner.
        },
      ),
      // child: ListView(
      //   children: [
      //     Stack(
      //       children: [
      //         Align(
      //           child: Container(
      //             height: MediaQuery.of(context).size.height * .61,
      //             width: MediaQuery.of(context).size.width - 40,
      //           ),
      //         ),
      //         Positioned(
      //           bottom: 0,
      //           child: Container(
      //             height: MediaQuery.of(context).size.height * .60,
      //             width: MediaQuery.of(context).size.width - 40,
      //             decoration: BoxDecoration(
      //               border: Border.all(color: Colors.grey.shade300, width: 1),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: Row(
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.only(left: 15, right: 20),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       txt("Name"),
      //                       txt("Gender"),
      //                       txt("Date of Birth"),
      //                       txt("School Name"),
      //                       txt("Grade"),
      //                       txt("Academic Year"),
      //                       txt("Nationality"),
      //                       txt("Religion"),
      //                       txt("Civil id"),
      //                       txt("Civil id expiry date"),
      //                       txt("Passport Number"),
      //                       txt("Address"),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(width: 10),
      //                 Flexible(
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         childrens.studentname,
      //                       ),
      //                       Text(childrens.gender),
      //                       Text(childrens.birthdate.day.toString() +
      //                           "/" +
      //                           childrens.birthdate.month.toString() +
      //                           "/" +
      //                           childrens.birthdate.year.toString()),
      //                       Text(childrens.schoolname),
      //                       Text(childrens.grade),
      //                       Text(childrens.academicyear),
      //                       Text(childrens.nationality),
      //                       Text(childrens.religion),
      //                       Text(childrens.civilid.toString()),
      //                       Text(childrens.studentcivilexpirydate.day
      //                               .toString() +
      //                           "/" +
      //                           childrens.studentcivilexpirydate.month
      //                               .toString() +
      //                           "/" +
      //                           childrens.studentcivilexpirydate.year
      //                               .toString()),
      //                       Text(childrens.passportnumber),
      //                       Text(childrens.regionalarea)
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           left: 15,
      //           top: 0,
      //           child: Padding(
      //             padding: EdgeInsets.only(bottom: 8),
      //             child: Container(
      //               height: 20,
      //               width: 83,
      //               color: Colors.white,
      //               child: Text(
      //                 "Student info",
      //                 style: TextStyle(color: kColorGreen),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //     ListView.builder(
      //       itemCount: 2,
      //       shrinkWrap: true,
      //       physics: NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, int index) {
      //         return Parentlist(parents, index);
      //       },
      //     ),
      //   ],
      // ),
    );
  }

  Widget Parentlist(List<ParentResponse> parents, int index) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Stack(children: [
            Align(
              child: Container(
                height: 210,
                // height: MediaQuery.of(context).size.height * .61,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            txt("Name".tr),
                            txt("Nationality".tr),
                            txt("Civil_ID".tr),
                            txt("Civil_id_Expiry_Date".tr),
                            txt("Email_address".tr),
                            txt("Address".tr),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedLang == "en_US"?parents[index].name:parents[index].arabicname,
                            maxLines: 2,
                          ),
                          Text(
                            parents[index].nationality,
                            maxLines: 2,
                          ),
                          Text(
                            parents[index].civilid,
                            maxLines: 2,
                          ),
                          Text(parents[index]
                                  .parentcivilexpirydate
                                  .day
                                  .toString() +
                              "/" +
                              parents[index]
                                  .parentcivilexpirydate
                                  .month
                                  .toString() +
                              "/" +
                              parents[index]
                                  .parentcivilexpirydate
                                  .year
                                  .toString()),
                          // Text(widget.parents[index].parentcivilexpirydate),

                          Text(
                            parents[index].emailid,
                            maxLines: 2,
                            overflow: TextOverflow.clip,
                          ),

                          Text(
                            parents[index].regionalarea,
                            maxLines: 2,
                          )
                        ],
                      ),
                    ]),
                  )),
            ),
            Positioned(
              left: 15,
              top: 0,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                  height: 20,
                  width: 83,
                  color: Colors.white,
                  child: Text(
                    "${parents[index].type}_info".tr,
                    style: TextStyle(color: kColorGreen),
                  ),
                ),
              ),
            ),
          ]),
        ],
      ),
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
    // debugPrint('parent civil id: ${data[1].emailid}');
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
                            txt("Name".tr),
                            txt("Gender".tr),
                            txt("Date_of_Birth".tr),
                            txt("School_Name".tr),
                            txt("Grade".tr),
                            txt("Academic_Year".tr),
                            txt("Nationality".tr),
                            txt("Religion".tr),
                            txt("Civil_ID".tr),
                            txt("Civil_id_Expiry_Date".tr),
                            txt("Passport_Number".tr),
                            txt("Address".tr),
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
                      " Mother_info".tr,
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

/*
class Installment extends StatefulWidget {
   Installment({Key key, this.data}) : super(key: key);
   InstallmentResponse data;
  @override
  _InstallmentState createState() => _InstallmentState();
}

class _InstallmentState extends State<Installment> {

  
 
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
class Installment extends StatelessWidget {
  Installment(
      {Key key,
      // this.txt,
      this.data})
      : super(key: key);
  // String txt;
  // PaymentPendingResponse data;
  // int index;
  InstallmentResponse data;

  @override
  Widget build(BuildContext context) {
    // return Text("hyy");
    // print("paymnt pending ${data.studentname}");
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              list_txt("Tuition_fees".tr, isSelected: false),
              list_txt("${data.tuitionfee.toString()} KD"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              list_txt("Transportation_Fee".tr, isSelected: false),
              list_txt("${data.transportfee.toString()} KD")
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              list_txt("Other".tr, isSelected: false), //true
              list_txt("${data.others.toString()} KD")
            ],
          )
        ],
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

class paymentList extends StatefulWidget {
  paymentList({Key key, this.data}) : super(key: key);

  dynamic data;
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
              Text(widget.data.studentname),
              Text(widget.data.dueamount.toString()),
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
                    "  Enrollment".tr,
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
