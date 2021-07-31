import 'package:flutter/material.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/widget/list.dart';

class ConfirmPayment extends StatefulWidget {
  const ConfirmPayment({Key key}) : super(key: key);

  @override
  _ConfirmPaymentState createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        title: Text("Confirm Payment",
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
            Container(
              height: MediaQuery.of(context).size.height * .54,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[200])),
              child: 
              Padding(
                padding: const EdgeInsets.all(10),
                child:
                 SingleChildScrollView(
                   child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Student", style: TextStyle(color: Colors.grey)),
                          Text("Amount", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return paymentList();
                          }),
                          
                    ],
                                 ),
                 ),
              ),
         ),
         SizedBox(height: 5,),
      // Padding(
                        //  padding: const EdgeInsets.all(8.0),
                        //  child:
                           Center(
                            child: Text("Add enrollment fee for confirming next academic year",
                            style: TextStyle(color: Colors.grey,fontSize:11,)),
                          ),
                       // ),
                        SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text("Total Amount"),
                          Text("1700 KD", style: TextStyle(fontWeight: FontWeight.bold), )
                        ],),
                        SizedBox(height: 20,),
                        confirmButtons(),
                        SizedBox(height: 5,),
                       SizedBox(
                         height:40,
                         width: double.infinity,
                         
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Confirming payment will take you",style: TextStyle(color:Colors.grey),),
                             Text("to payment gateway",style: TextStyle(color:Colors.grey), ),
                           ],
                         )),
                         SizedBox(height:20)

          ],
        ),
      ),
    );
  }
}