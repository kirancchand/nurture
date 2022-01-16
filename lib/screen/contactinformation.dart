  import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nurture/model/student.dart';
import 'package:nurture/model/fee.dart';
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
import 'package:nurture/localization.dart';
class ContactInformation extends StatefulWidget {
  ContactInformation({Key key}) : super(key: key);
  List<FeeResponse> childrens = Get.arguments;

  @override
  _ContactInformationState createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  var _valueChoose;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StudentContactRequestModel studentContactRequestModel;
  LoginRequestModel loginRequestModel;
  String selectedLang=(Get.locale.toString() == "en_US")?"en_US":"ar_AB";
  bool choose = false;
  FilePickerResult resultpdf;
  PlatformFile file;
  Future getPdf() async {
    resultpdf = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc','png','jpeg'],
    );
    if(resultpdf != null) {
      setState(() {
        file = resultpdf.files.first;
      });


      // print(file.name);
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      // User canceled the picker
    }
    return resultpdf.files.first;
  }

  PlatformFile x;
 // String dropdownError;

  @override
  void initState() {
    super.initState();
    studentContactRequestModel = new StudentContactRequestModel(
        studentname: '',
        studentemail: '',
        studentphonenumber: '',
        studentinquiry: '');
    loginRequestModel = new LoginRequestModel(Username: '', Password: '');
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint("${widget.childrens[0].studentname}");
    return Spinner(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            selectedLang=="en_US"?Icons.keyboard_arrow_left:Icons.keyboard_arrow_right,
            color: Colors.white,

          ),
          iconSize: 36,
        ),
        toolbarHeight: 80,
        title: Text("Contact_Us".tr,
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
        child: ListView(
          children: [
            /*Text("Enquiry type"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  child: CircleAvatar(
                      radius: 11,
                      backgroundColor: kColorGreen,
                      child: choose
                          ? CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: kColorGreen,
                              ),
                            )
                          : CircleAvatar(
                                radius:10,
                                backgroundColor: Colors.white,
                              )),
                  onTap: () {
                    setState(() {
                      
                      // print("object");
                    });
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "General",
                  style: TextStyle(color: kColorGreen),
                ),
                SizedBox(
                  width: 47.3,
                ),
                CircleAvatar(
                  radius: 11,
                  backgroundColor: kColorGreen,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: kColorGreen,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Student",
                  style: TextStyle(color: kColorGreen),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),*/

            // Padding(
            // padding: const EdgeInsets.all(20),
            // child:
            Container(
              child: Form(
                key: formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownButtonFormField(
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: kColorGreen,
                        ),
                        value: studentContactRequestModel.studentid,
                        hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Select_Student".tr,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            // _valueChoose = newValue;
                            studentContactRequestModel.studentid = newValue;
                          });
                        },
                        validator: (value) =>
                            value == null ? "Please select a student" : null,
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
                      Column(
                          children: contactReqInputs(
                              studentContactRequestModel, context)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              x = await getPdf();

                            },
                            child: Text(
                              "Add_attachment".tr,
                              style: TextStyle(
                                decoration: (TextDecoration.underline),
                                color: kColorGreen,
                              ),
                            ),
                          ),

                        ],

                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          file!=null?Text(
                            file.name,
                            style: TextStyle(
                              color: kColorGreen,
                            ),
                          ):Text("", style: TextStyle(
                              color: Colors.red,
                            ))
                          // file!=null?Text(
                          //   file.name,
                          //   style: TextStyle(
                          //     color: kColorGreen,
                          //   ),
                          // ):Text("Please Add Attachment", style: TextStyle(
                          //   color: Colors.red,
                          // ))
                        ],

                      ),

                      SizedBox(
                        height: 30,
                      ),
                      Column(
                          children: contactReqButton(context,
                              formKey, studentContactRequestModel, x)),

                    ],
                  ),
                ),
              ),
            )

            // ),
          ],
        ),
      ),
    ));
  }
}
