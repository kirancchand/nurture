import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/screen/home.dart';
import 'package:nurture/widget/spinner.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nurture/service/api.dart';
import 'package:nurture/model/fee.dart';
import 'package:get/get.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/Pdf.dart';
class ReceiptView extends StatefulWidget {
  ReceiptView({Key key, this.link}) : super(key: key);
  String link;

  @override
  _ReceiptViewState createState() => _ReceiptViewState();
}

class _ReceiptViewState extends State<ReceiptView> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.link);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade200,
        leading: InkWell(
            onTap: () {

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(
                    count: 2,
                  ),
                ),
              );


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
            initialUrl: ('https://docs.google.com/gview?embedded=true&url=${widget.link}'),
            // initialUrl: widget.link,
            onPageStarted: (String url) {
              return Center(child: SpinKitWave(color: Colors.blue,));
            },
            onPageFinished: (String url) {

            },
            gestureNavigationEnabled: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Fluttertoast.showToast(msg: "Download Feature will Update Soon");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFScreen(
                link: widget.link
              ),
            ),
          );
        },
        child: const Icon(Icons.download),
        backgroundColor: kColorGreen,
      ),
    );
  }
}
