import 'package:flutter/material.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/common/constants.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:nurture/model/contact.dart';
import 'package:nurture/widget/validators.dart';
import 'package:nurture/widget/inputs.dart';
import 'package:nurture/model/login_model.dart';
import 'package:nurture/widget/spinner.dart';

class ContactInformation extends StatefulWidget {
   ContactInformation({Key key}) : super(key: key);
   List<StudentResponse> childrens = Get.arguments;

  @override
  _ContactInformationState createState() => _ContactInformationState();

}

class _ContactInformationState extends State<ContactInformation> {
  var _valueChoose;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StudentContactRequestModel studentContactRequestModel;
  LoginRequestModel loginRequestModel;

  @override
  void initState() {
    super.initState();
    studentContactRequestModel = new StudentContactRequestModel(studentname: '', studentemail: '',studentphonenumber:'',studentissuesubject:'',studentinquiry:'');
    loginRequestModel = new LoginRequestModel(Username: '', Password: '');
  }


  @override
  Widget build(BuildContext context) {
    // debugPrint("${widget.childrens[0].studentname}");
    return Spinner(
    child:Scaffold(
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
        title: Text("Contact Us",
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
      body: 
    ListView(
           children: [
             Padding(
               padding: const EdgeInsets.all(20),
               child:Container(
                 child:Form(
                   key: formKey,
                   child: Center(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         DropdownButton(
                           isExpanded: true,
                           icon: Icon(
                             Icons.keyboard_arrow_down_outlined,
                             color: kColorGreen,
                           ),
                           value: studentContactRequestModel.studentid,
                           hint:Align(
                             alignment: Alignment.centerLeft,
                             child: Text(
                               "Select Student",
                               style: TextStyle(color: Colors.grey),
                             ),
                           ),
                           onChanged: (newValue) {
                             setState(() {
                               // _valueChoose = newValue;
                               studentContactRequestModel.studentid=newValue;
                             });
                           },
                           items: widget.childrens.map((valueItem) {
                             return DropdownMenuItem(
                               value: valueItem.studentid,
                               child: Text(valueItem.studentname),
                             );
                           }).toList(),
                         ),
                         Column(
                             children:contactReqInputs(studentContactRequestModel)
                         ),
                         Column(
                             children:contactReqButton(formKey,studentContactRequestModel)
                         )
                       ],
                     ),
                   ),
                 ),
               )

             ),
           ],
         ),
      
    )
    );
  }
}
