import 'package:flutter/material.dart';
import 'package:nurture/widget/validators.dart';
import 'package:nurture/common/constants.dart';

List<Widget> loginInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text(
          "Sign in",
          style: TextStyle(fontSize: 25),
        ),
      ],
    ),
    TextFormField(
      key: Key('username'),
      decoration: InputDecoration(
          labelText: ' Enter Username',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      validator: EmailFieldValidator.validate,
      initialValue: "G-0000001035",
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    TextFormField(
      key: Key('password'),
      decoration: InputDecoration(
          labelText: 'Enter Password',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      initialValue: "P@ssword1",
      validator: PasswordFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Password = value,
    ),
    SizedBox(
      height: 35,
    ),
  ];
}

List<Widget> otpInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text("Enter 4 digit PIN", style: TextStyle(fontSize: 25)),
      ],
    ),
    TextFormField(
      key: Key('pin'),
      decoration: InputDecoration(
          labelText: ' Enter PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      initialValue: "G-0000002102",
      validator: OtpFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    TextFormField(
      key: Key('confirm'),
      decoration: InputDecoration(
          labelText: 'Confirm PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      obscureText: true,
      initialValue: "MBXEXPZX",
      validator: ConfirmOtpFieldFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Password = value,
    ),
    SizedBox(
      height: 35,
    )
  ];
}

List<Widget> pinInputs(loginRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text("Login", style: TextStyle(fontSize: 25)),
      ],
    ),
    TextFormField(
      key: Key('pin'),
      decoration: InputDecoration(
          labelText: ' Enter PIN',
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[300])),
          labelStyle: TextStyle(color: Colors.grey[400])),
      initialValue: "MBXEXPZX",
      validator: PinFieldValidator.validate,
      onSaved: (String value) => loginRequestModel.Username = value,
    ),
    SizedBox(
      height: 35,
    )
  ];
}

List<Widget> contactReqInputs(studentContactRequestModel) {
  return <Widget>[
    Row(
      children: [
        Text(
          " Contact Information",
          //  style: TextStyle(fontSize: 25),
        ),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            key: Key('studentname'),
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,

            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "full name",
                hintStyle: TextStyle(color: Colors.grey)),
            validator: EmailFieldValidator.validate,
            // initialValue: "G-0000001035",
            onSaved: (String value) =>
                studentContactRequestModel.studentname = value,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            key: Key('studentemail'),
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,

            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.grey)),
            //obscureText: true,
            // initialValue: "P@ssword1",
            validator: PasswordFieldValidator.validate,
            onSaved: (String value) =>
                studentContactRequestModel.studentemail = value,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            key: Key('studentphonenumber'),
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Phone number",
                hintStyle: TextStyle(color: Colors.grey)),
            validator: PasswordFieldValidator.validate,
            onSaved: (String value) =>
                studentContactRequestModel.studentphonenumber = value,
          ),
        ),
      ),
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text("  What is the issue about?"),
      ],
    ),
    Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: TextFormField(
            key: Key('studentissuesubject'),
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Subject",
                hintStyle: TextStyle(color: Colors.grey)),
            validator: PasswordFieldValidator.validate,
            onSaved: (String value) =>
                studentContactRequestModel.studentissuesubject = value,
          ),
        ),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("  Tell us more..."),
        Text(
          "0/1500",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextFormField(
            minLines: 1,
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            key: Key('studentinquiry'),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Please enter your inquiry.....",
                hintStyle: TextStyle(color: Colors.grey)),
            validator: PasswordFieldValidator.validate,
            onSaved: (String value) =>
                studentContactRequestModel.studentinquiry = value,
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

    /* Container(
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
                            SizedBox(height: 31),*/
  ];
}


// List<Widget> contactInputs(studentContactRequestModel) {
  // var _valueChoose;
  // return <Widget>[
     // TextFormField(
     //   key: Key('username'),
//     //   decoration: InputDecoration(
//     //       labelText: ' Enter Username',
//     //       enabledBorder: UnderlineInputBorder(
//     //           borderSide: BorderSide(color: Colors.grey[300])),
//     //       labelStyle: TextStyle(color: Colors.grey[400])),
//     //   validator: EmailFieldValidator.validate,
//     //   initialValue: "G-0000001035",
//     //   onSaved: (String value) => studentContactRequestModel.Username = value,
//     // ),
//     // TextFormField(
//     //   key: Key('password'),
//     //   decoration: InputDecoration(
//     //       labelText: 'Enter Password',
//     //       enabledBorder: UnderlineInputBorder(
//     //           borderSide: BorderSide(color: Colors.grey[300])),
//     //       labelStyle: TextStyle(color: Colors.grey[400])),
//     //   obscureText: true,
//     //   initialValue: "P@ssword1",
//     //   validator: PasswordFieldValidator.validate,
//     //   onSaved: (String value) => studentContactRequestModel.Password = value,
//     // ),
 //    ListView(
   //    children: [
     //    DropdownButton(
//           isExpanded: true,
//           icon: Icon(
//             Icons.keyboard_arrow_down_outlined,
//             color: kColorGreen,
//           ),
//           value: _valueChoose,
//           hint:Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "Select Student",
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           onChanged: (newValue) {
//             setState(() {
//               _valueChoose = newValue;
//             });
//           },
//           items: widget.childrens.map((valueItem) {
//             return DropdownMenuItem(
//               value: valueItem.studentid,
//
//               child: Text(valueItem.studentname),
//             );
//           }).toList(),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text("  Contact information"),
//         Padding(
//           padding: const EdgeInsets.only(top: 8, bottom: 8),
//           child: TextFormField(
//             key: Key('studentname'),
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey[200]),
//                     borderRadius: BorderRadius.circular(8)),
//                 hintText: "Full name",
//                 hintStyle:TextStyle(color: Colors.grey)
//             ),
//             validator: PasswordFieldValidator.validate,
//             onSaved: (String value) => studentContactRequestModel.studentname = value,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8, bottom: 8),
//           child: TextFormField(
//             key: Key('studentemail'),
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey[200]),
//                     borderRadius: BorderRadius.circular(8)),
//                 hintText: "Email",
//                 hintStyle:TextStyle(color: Colors.grey)
//             ),
//             validator: PasswordFieldValidator.validate,
//             onSaved: (String value) => studentContactRequestModel.studentemail = value,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 8, bottom: 8),
//           child: TextFormField(
//             key: Key('studentphonenumber'),
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey[200]),
//                     borderRadius: BorderRadius.circular(8)),
//                 hintText: "Phone number",
//                 hintStyle:TextStyle(color: Colors.grey)
//             ),
//             validator: PasswordFieldValidator.validate,
//             onSaved: (String value) => studentContactRequestModel.studentphonenumber = value,
//           ),
//         ),
//         SizedBox(
//           height: 10,
//         ),
//         Text("  What is the issue about?"),
//         Padding(
//           padding: const EdgeInsets.only(top: 8, bottom: 8),
//           child: TextFormField(
//             key: Key('studentissuesubject'),
//             decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey[200]),
//                     borderRadius: BorderRadius.circular(8)),
//                 hintText: "Subject",
//                 hintStyle:TextStyle(color: Colors.grey)
//             ),
//             validator: PasswordFieldValidator.validate,
//             onSaved: (String value) => studentContactRequestModel.studentissuesubject = value,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text("  Tell us more..."),
//
//             Text("0/1500",style: TextStyle(color: Colors.grey),),
//           ],
//         ),
//         SizedBox(height: 10,),
//         Container(
//             height: 200,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey[300]),
//                 borderRadius: BorderRadius.circular(8)),
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: TextFormField(
//                 key: Key('studentinquiry'),
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     //enabledBorder: OutlineInputBorder(
//                     //   borderSide: BorderSide(color: Colors.grey[200]),
//                     //  borderRadius: BorderRadius.circular(8)),
//                     hintText: "Please enter your inquiry.....",
//                     hintStyle:TextStyle(color: Colors.grey)
//                 ),
//                 validator: PasswordFieldValidator.validate,
//                 onSaved: (String value) => studentContactRequestModel.studentinquiry = value,
//               ),
//             )),
//         SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               "Add Attachment",
//               style: TextStyle(
//                 color: kColorGreen,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 31),
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: submitButtons(formKey,studentContactRequestModel),
//         )
//       ],
//     ),
//     SizedBox(
//       height: 35,
//     ),
//   ];
// } 
