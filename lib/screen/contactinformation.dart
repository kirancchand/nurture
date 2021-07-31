import 'package:flutter/material.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/common/constants.dart';
class ContactInformation extends StatefulWidget {
  const ContactInformation({Key key}) : super(key: key);

  @override
  _ContactInformationState createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
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
         Padding(
           padding: const EdgeInsets.all(20),
           child: ListView(
            children: [
            
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text("Enquiry type"),
              ),
              Container(
                height: 20,
                width: double.infinity,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: kColorGreen,
                      radius: 10,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      "  general",
                      style: TextStyle(color: kColorGreen),
                    ),
                    SizedBox(width: 30),
                    CircleAvatar(
                      backgroundColor: kColorGreen,
                      radius: 10,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    Text(
                      "  Student",
                      style: TextStyle(color: kColorGreen),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                   // labelText: "select student",
                    hintText:"select student",
                   enabledBorder: UnderlineInputBorder(
                     borderSide: BorderSide(color:Colors.grey[200])
                   ),
                    hintStyle:TextStyle(color: Colors.grey),
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: kColorGreen,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text("  Contact information"),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Full name",
                    hintStyle:TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Email",
                    hintStyle:TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Phone number",
                    hintStyle:TextStyle(color: Colors.grey)
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("  What is the issue about?"),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[200]),
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Subject",
                    hintStyle:TextStyle(color: Colors.grey)
                  ),
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
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //enabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.grey[200]),
                        //  borderRadius: BorderRadius.circular(8)),
                        hintText: "Please enter your inquiry.....",
                        hintStyle:TextStyle(color: Colors.grey)
                      ),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: submitButtons(),
              )
            ],
        ),
         ),
      
    );
  }
}