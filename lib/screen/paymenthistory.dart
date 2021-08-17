import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/screen/modeldownload.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/model/paymenthistory.dart';
import 'package:nurture/service/api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  List listItem = ["2021-2022", "2020-2021", "2019-2020"];
  Api api = new Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        /*/ titleSpacing: 60,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
        ),*/
        toolbarHeight: 80,
        title: GestureDetector(
          onTap: () {
            print("welcome to download page");
           // Get.to(ModelDownload());
          },
          child: Text("Payment history ",
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff43CEA2),
            Color(0xff279DD4),
          ])),
        ),
      ),
      body: ListView(
        children: [
          // Header(),
          Container(
            child: FutureBuilder<PaymentHistoryResponseModel>(
              future: api.getPaymentHistory(),
              builder: (BuildContext context,
                  AsyncSnapshot<PaymentHistoryResponseModel> snapshot) {
                if (snapshot.hasData) {
                  var response = snapshot.data?.response;
                  // print(data[0]);
                  // // data.response.length>0?
                  // var response=[];
                  return response.length > 0
                      ? ListView.builder(
                          itemCount: response.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            // print(response[index].studentname);

                            return paymentHistoryList(data: response[index]);
                          },
                        )
                      : Center(child: Text("No Data"));
                } else if (snapshot.hasError) {
                  // return Text("${snapshot.error}");
                  return Text("${snapshot.error}");
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.height,
                    child: Center(child: SpinKitRipple(color: Colors.blue,)));
                }

                // By default, show a loading spinner.
              },
            ),
          ),
        ],
      ),
    );
  }
  /* 
  Widget Header() {
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
                Text("Payment history",
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
                            "Academic Year",
                            style: TextStyle(color: kColorGreen),
                          ),
                          Center(
                              child: DropdownButton(

                                isExpanded: true,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: kColorGreen,
                                ),
                                value: listItem[0],
                                onChanged: (newValue) {
                                  setState(() {
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
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
*/
}
