import 'package:flutter/material.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/student.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({Key key, this.data, this.parents}) : super(key: key);
  StudentResponse data;
  List<ParentResponse> parents;

  @override
  Widget build(BuildContext context) {
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
              Icons.keyboard_arrow_left,
              color: Colors.white,
            ),
          ),
          toolbarHeight: 80,
          title: Text("Student Details",
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
          Flexible(child: StudentInfoList(data: data, parents: parents)),
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
