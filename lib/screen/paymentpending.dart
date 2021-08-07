import 'package:flutter/material.dart';
import 'package:nurture/widget/buttons.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/paymentpending.dart';

class PaymentPending extends StatefulWidget {
  const PaymentPending({Key key}) : super(key: key);

  @override
  _PaymentPendingState createState() => _PaymentPendingState();
}

class _PaymentPendingState extends State<PaymentPending> {
  var _valueChoose;
  Api api = new Api();
  List listItem =
     ["Asim Muhammad", "Dana Muhammad", "Dalal Muhammad"];
  
  
  Future<PaymentPendingResponseModel> getPayment;
  @override
  void initState() {
    super.initState();
    getPayment = api.getPendingPayment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [_header(), _installmentSection()],
    ));
  }

  Widget _header() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .30,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .17,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff43CEA2),
                Color(0xff279DD4),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text("Payment Pending",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(
                  height: 17,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height * .137,
                  width: MediaQuery.of(context).size.width * .85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Student",
                            style: TextStyle(color: kColorGreen),
                          ),
                          Center(
                              child: DropdownButton(
                            isExpanded: true,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.greenAccent,
                            ),
                            value: _valueChoose,
                            onChanged: (newValue) {
                              setState(() {
                                _valueChoose = newValue;
                              });
                            },
                            items: listItem.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ))
                          // DropdownButtonFormField(items: items)
                        ],
                      )
                      /*
       TextFormField(
        decoration: InputDecoration(
          labelText: "Student",
          suffixIcon: Icon(Icons.keyboard_arrow_down_outlined),
        ),
      ),
*/

                      ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _installmentSection() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Academic year: 2021-2022",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            // height: MediaQuery.of(context).size.height * .70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, right: 20),
                child: Column(
                  children: [
                    Container(
                      child: FutureBuilder<PaymentPendingResponseModel>(
                        future: getPayment,
                        builder: (BuildContext context,
                            AsyncSnapshot<PaymentPendingResponseModel>
                                snapshot) {
                          if (snapshot.hasData) {
                            var response = snapshot.data?.response;

                            // // data.response.length>0?
                            // var response=[];
                            return response.length > 0
                                ? ListView.builder(
                                    itemCount: response.length,
                                    shrinkWrap: true,
                                    physics: ClampingScrollPhysics(),
                                    itemBuilder: (context, int index) {
                                      // print(response[index].studentname);
                                      // data:response[index]
                                      return Installment();
                                    },
                                  )
                                : Center(child: Text("No Data"));
                          } else if (snapshot.hasError) {
                            // return Text("${snapshot.error}");
                            return Text("${snapshot.error}");
                          } else {
                            return CircularProgressIndicator();
                          }

                          // By default, show a loading spinner.
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 10),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "500 KD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: payNowButtons(),
                    ),
                    SizedBox(height: 20)
                  ],
                )),
          ),
        ],
      ),
    );
  }
  // Widget installment(){
  //   return  Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 newMethod2("Installment 1"),
  //                 newMethod2("Installment 2"),
  //                 SizedBox(height:15 ,),
  //                 Text("Installment 3"),
  //                 SizedBox(height:10 ,),
  //                 _IsSelectedItem(),
  //                 Padding(
  //                   padding:
  //                       const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
  //                   child: Divider(),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text(
  //                       "Total",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                     Text(
  //                       "500 KD",
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: 40),
  //                 Center(
  //                   child:payNowButtons(),
  //                 )
  //               ],
  //             );
  // }

  // Column newMethod2(String txt3) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(top: 15),
  //         child: Text(txt3),
  //       ),
  //       SizedBox(
  //         height: 6,
  //       ),
  //
  //       newMethodtxt("Tution", "0 KD"),
  //       newMethodtxt("Transportation", "0 KD"),
  //       newMethodtxt("Other", "0 KD"),
  //     ],
  //   );
  // }

  // Padding newMethodtxt(String txt1, String txt2) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 5, bottom: 3),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [_txt(txt1), _txt(txt2)],
  //     ),
  //   );
  // }

  // Widget _IsSelectedItem() {
  //   return Column(
  //     children: [
  //       newMethodSelected("Tution", "300 KD"),
  //       newMethodSelected("TransPortation", "200 KD"),
  //       newMethodtxt("Other", "0 KD"),
  //     ],
  //   );
  // }

  // Padding newMethodSelected(String txt4, String txt5) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 5,bottom: 3),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [_txt(txt4, isSelected: true), _txt(txt5, isSelected: true)],
  //     ),
  //   );
  // }

  // Widget _txt(String txt, {bool isSelected = false}) {
  //   return Text(
  //     txt,
  //     style: TextStyle(color: isSelected ? Colors.red : Colors.grey),
  //   );
  // }

}
