import 'package:flutter/material.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/common/constants.dart';
import 'package:get/get.dart';
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:nurture/model/contact.dart';
import 'package:nurture/widget/validators.dart';

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
  @override
  Widget build(BuildContext context) {
    // debugPrint("${widget.childrens[0].studentname}");
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
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
              child: Form(
            key: formKey,
            child: ListView(
              children: [
                DropdownButton(
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: kColorGreen,
                  ),
                  value: _valueChoose,
                  hint: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Select Student",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _valueChoose = newValue;
                    });
                  },
                  items: widget.childrens.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem.studentid,
                      child: Text(valueItem.studentname),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("  Contact information"),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextFormField(
                    key: Key('studentname'),
                    decoration: InputDecoration(
                        labelText: ' Enter Student Name',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[300])),
                        labelStyle: TextStyle(color: Colors.grey[400])),
                    validator: EmailFieldValidator.validate,
                    initialValue: "G-0000001035",
                    onSaved: (String value) =>
                        studentContactRequestModel.studentname = value,
                  ),
                ),
                /*
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: TextFormField(
                                key: Key('studentemail'),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Email",
                                    hintStyle:TextStyle(color: Colors.grey)
                                ),
                                validator: PasswordFieldValidator.validate,
                                onSaved: (String value) => studentContactRequestModel.studentemail = value,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: TextFormField(
                                key: Key('studentphonenumber'),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Phone number",
                                    hintStyle:TextStyle(color: Colors.grey)
                                ),
                                validator: PasswordFieldValidator.validate,
                                onSaved: (String value) => studentContactRequestModel.studentphonenumber = value,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("  What is the issue about?"),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: TextFormField(
                                key: Key('studentissuesubject'),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[200]),
                                        borderRadius: BorderRadius.circular(8)),
                                    hintText: "Subject",
                                    hintStyle:TextStyle(color: Colors.grey)
                                ),
                                validator: PasswordFieldValidator.validate,
                                onSaved: (String value) => studentContactRequestModel.studentissuesubject = value,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("  Tell us more..."),
                           
                                Text("0/1500",style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextFormField(
                                    key: Key('studentinquiry'),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                           borderSide: BorderSide(color: Colors.grey[200]),
                                         borderRadius: BorderRadius.circular(8)),
                                        hintText: "Please enter your inquiry.....",
                                        hintStyle:TextStyle(color: Colors.grey)
                                    ),
                                    validator: PasswordFieldValidator.validate,
                                    onSaved: (String value) => studentContactRequestModel.studentinquiry = value,
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Add Attachment",
                                  style: TextStyle(
                                    color: kColorGreen,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 31),
                          */
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: submitButtons(formKey, studentContactRequestModel),
                )
              ],
            ),
          ))),
    );
  }
}
