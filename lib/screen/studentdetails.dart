import 'package:flutter/material.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/fee.dart';
import 'package:get/get.dart';
import 'package:nurture/localization.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({Key key, this.data}) : super(key: key);
  FeeResponse data;
  String selectedLang=(Get.locale.toString() == "en_US")?"en_US":"ar_AB";

  @override
  Widget build(BuildContext context) {
    print("sdsd${selectedLang}");
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          ),
          toolbarHeight: 80,
          title: Text("Student_Details".tr,
              style: TextStyle(
                color: Colors.white,
              )),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff43CEA2),
              Color(0xff279DD4),
            ])),
          ),
        ),
        body: Container(
            child: Column(children: [
              Flexible(child: StudentInfoList(data: data)),
          /*
              Expanded(
                child:
                ListView.builder(
                  itemCount:2,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, int index) {
                    // print(studentResponse);
                    return ParentsInfoList(data:parents);
                  },
                ),
              )*/
        ])

            // Stack(
            //     children:[
            //       ListView.builder(
            //         itemCount:2,
            //         shrinkWrap: true,
            //         physics: ClampingScrollPhysics(),
            //         itemBuilder: (context, int index) {
            //           // print(studentResponse);
            //           return ParentsInfoList(data:parents);
            //         },
            //       ),
            //     ]
            // )

            //  )

            // children:[
            //   Expanded(child: StudentInfoList(data:data)),
            //   Expanded(
            //     child:ListView.builder(
            //       itemCount:2,
            //       shrinkWrap: true,
            //       physics: ClampingScrollPhysics(),
            //       itemBuilder: (context, int index) {
            //         // print(studentResponse);
            //         return ParentsInfoList(data:parents);
            //       },
            //     ),
            //   )
            // ]

            // body: Container(
            //   child:StudentInfoList(data:data),
            //   // children:[
            //   //   StudentInfoList(data:data),
            //   //   ParentsInfoList(data:parents)
            //   // ]
            // )

            // ListView(children: [
            //
            //             ListView.builder(
            //                   itemCount: 5,
            //                   shrinkWrap: true,
            //                   physics: ClampingScrollPhysics(),
            //                   itemBuilder: (context, int index) {
            //                     // print(studentResponse);
            //                     return StudentInfoList();
            //                   },
            //                 ),
            // ],),
            ));
  }
}
