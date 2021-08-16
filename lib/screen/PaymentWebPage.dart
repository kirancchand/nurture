import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nurture/screen/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebPage extends StatefulWidget {
  PaymentWebPage({Key key, this.link}) : super(key: key);
  String link;

  @override
  _PaymentWebPageState createState() => _PaymentWebPageState();
}

class _PaymentWebPageState extends State<PaymentWebPage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

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
            initialUrl: widget.link,
            onPageStarted: (String url) {
              return Center(child: CircularProgressIndicator());
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          ),
        ),
      ),
    );
  }
}
