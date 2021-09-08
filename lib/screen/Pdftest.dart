import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nurture/screen/download.dart';
import 'package:nurture/common/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PDFScreen extends StatefulWidget {
  final String link;

  PDFScreen({this.link});

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Directory directory;
  File pdf;
  bool spin = true;
  Future<File> downloadPdf(String url) async {
    Completer<File> completer = Completer();
    // print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      // final url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      directory = await getExternalStorageDirectory();
      //print("Download files");
      // /${DateTime.now().toString()}
      // print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename.pdf");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    pdf = await completer.future;
  }

  GlobalKey _globalKey = GlobalKey();
  Completer<WebViewController> _controllerweb = Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    downloadPdf(widget.link).then((value) {
      setState(() {
        spin = false;
      });
    });

    super.initState();
    _requestPermission();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    //print(info);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData>);
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      //print(result);
    }
  }

  _getHttp() async {
    var response = await Dio().get(
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    // print(result);
  }

  _saveGif() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/temp.gif";
    String fileUrl =
        "https://hyjdoc.oss-cn-beijing.aliyuncs.com/hyj-doc-flutter-demo-run.gif";
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    //print(result);
  }

  _saveVideo() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/temp.mp4";
    String fileUrl =
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4";
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      // print((count / total * 100).toStringAsFixed(0) + "%");
    });
    final result = await ImageGallerySaver.saveFile(savePath);
    //  print(result);
  }
  // _saveScreen() async {
  //   RenderRepaintBoundary boundary =
  //   _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData>);
  //   if (byteData != null) {
  //     final result =
  //     await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
  //     print(result);
  //     _toastInfo(result.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spin
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: <Widget>[
                PDFView(
                  filePath: pdf.path,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: currentPage,
                  fitPolicy: FitPolicy.BOTH,
                  preventLinkNavigation:
                      false, // if set to true the link is handled in flutter
                  onRender: (_pages) {
                    setState(() {
                      pages = _pages;
                      isReady = true;
                    });
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                    // print(error.toString());
                  },
                  onPageError: (page, error) {
                    setState(() {
                      errorMessage = '$page: ${error.toString()}';
                    });
                    // print('$page: ${error.toString()}');
                  },
                  onViewCreated: (PDFViewController pdfViewController) {
                    _controller.complete(pdfViewController);
                  },
                  onLinkHandler: (String uri) {
                    //print('goto uri: $uri');
                  },
                  onPageChanged: (int page, int total) {
                    //print('page change: $page/$total');
                    setState(() {
                      currentPage = page;
                    });
                  },
                ),
                errorMessage.isEmpty
                    ? !isReady
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container()
                    : Center(
                        child: Text(errorMessage),
                      ),
                Column(
                  children: <Widget>[
                    RepaintBoundary(
                        key: _globalKey,
                        child: Column(
                          children: [
                            WebView(
                              javascriptMode: JavascriptMode.unrestricted,
                              initialUrl: widget.link,
                              onPageStarted: (String url) {
                                return Center(
                                    child: SpinKitWave(
                                  color: Colors.blue,
                                ));
                              },
                              onPageFinished: (String url) {
                                //print('Page finished loading: $url');
                                //print(url.contains('paymentcancel'));
                              },
                              gestureNavigationEnabled: true,
                            ),
                          ],
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        onPressed: _saveScreen,
                        child: Text("Save Local Image"),
                      ),
                      width: 200,
                      height: 44,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        onPressed: _getHttp,
                        child: Text("Save network image"),
                      ),
                      width: 200,
                      height: 44,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        onPressed: _saveVideo,
                        child: Text("Save network video"),
                      ),
                      width: 200,
                      height: 44,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: RaisedButton(
                        onPressed: _saveGif,
                        child: Text("Save Gif to gallery"),
                      ),
                      width: 200,
                      height: 44,
                    ),
                  ],
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          // _saveScreen
        },
        child: const Icon(Icons.download),
        backgroundColor: kColorGreen,
      ),
      // floatingActionButton: FutureBuilder<PDFViewController>(
      //   future: _controller.future,
      //   builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
      //     if (snapshot.hasData) {
      //       return FloatingActionButton.extended(
      //         label: Text("Go to ${pages ~/ 2}"),
      //         onPressed: () async {
      //           await snapshot.data.setPage(pages ~/ 2);
      //         },
      //       );
      //     }

      //     return Container();
      //   },
      // ),
    );
  }
}
