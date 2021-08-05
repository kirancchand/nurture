import 'package:flutter/material.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/student.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({ Key key,this.data,this.parents }) : super(key: key);
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
      body: SingleChildScrollView(
          child:Column(
            children:[
              StudentInfoList(data:data),
              ListView.builder(
                itemCount: parents.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, int index) {
                  // print(response[index].studentname);
                  // data:response[index]
                  return ParentsInfoList(data:parents);
                },
              )
            ]
          )



      )

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
      
    );
  }
}