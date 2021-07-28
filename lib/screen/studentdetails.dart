import 'package:flutter/material.dart';
import 'package:nurture/widget/list.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({ Key key }) : super(key: key);

  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
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
            Colors.greenAccent,
            Colors.lightBlueAccent,
            Colors.lightBlue,
          ])),
        ),
      ),
      body:  ListView(children: [
         ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return StudentInfoList();
                        },
                      ),
      ],),
      
    );
  }
}