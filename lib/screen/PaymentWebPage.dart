import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/fee.dart';
import 'package:get/get.dart';
import 'package:nurture/config/controller.dart';
class PaymentWebPage extends StatefulWidget {
  PaymentWebPage({Key key, this.link}) : super(key: key);
  String link;

  @override
  _PaymentWebPageState createState() => _PaymentWebPageState();
}

class _PaymentWebPageState extends State<PaymentWebPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  Api api = new Api();

  Future<FeeResponseModel> getFee;
  YearController con = Get.put(YearController());
  StudentController students=Get.put(StudentController());
  ChildrenController childlistcon=Get.put(ChildrenController());
  List childrens = [];
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        leading: InkWell(
            onTap: () {

              api.getFee().then((fee) {
                print(fee.statuscode);
                // Fluttertoast.showToast(msg: "Something went Wrong");

                if(fee.statuscode=="200")
                {
                  con.year.value = fee.response.academicyear;
                  childrens = fee.response.children;
                  childlistcon.childrenlist=fee.response.children;
                  students.student.value=fee;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                        count: 2,
                      ),
                    ),
                  );
                }
                else{

                  Fluttertoast.showToast(msg: "Something went Wrong");
                  Get.toNamed("/");
                }


                // return fee;

              });


            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.link,
            onPageStarted: (String url) {
              return Center(child: SpinKitWave(color: Colors.blue,));
            },
            onPageFinished: (String url) {
              
              print('Page finished loading: $url');
              print(url.contains('paymentcancel'));

              if(url.contains('PaymentUrl')||url.contains('paymentcancel'))
                {
                  api.getFee().then((fee) {
                    print(fee.statuscode);
                    // Fluttertoast.showToast(msg: "Something went Wrong");
                    // https://schbackend.azurewebsites.net/Controllers/PaymentUrl.html?Response=Data
                    if(fee.statuscode=="200")
                    {
                      print("duem child ${fee.response.children[1].dueamount}");
                      con.year.value = fee.response.academicyearid;
                      childrens = fee.response.children;
                      childlistcon.childrenlist=fee.response.children;
                      students.student.value=fee;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(
                            count: 2,
                          ),
                        ),
                      );
                    }
                    else{

                      Fluttertoast.showToast(msg: "Something went Wrong");
                      Get.toNamed("/");
                    }


                    // return fee;

                  });

                }
            },
            gestureNavigationEnabled: true,
          ),
        ),
      ),
    );
  }
}
