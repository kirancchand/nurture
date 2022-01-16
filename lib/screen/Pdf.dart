import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:nurture/common/constants.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;
import 'package:dio/dio.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:nurture/screen/home.dart';
class PDFScreen extends StatefulWidget {
  final String link;

  PDFScreen({this.link});

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  GlobalKey _globalKey = GlobalKey();
  String _base64 = "";
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int pages = 0;
  int currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  Directory directory;
  File pdf;
  // bool spin = true;
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

      // String uri = 'data:image/jpg;base64,';
      // Uint8List _bytes = base64.decode(uri.split(',').last);

    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    pdf = await completer.future;
  }

  Uint8List _bytesImage;
  @override
  void initState() {
    // TODO: implement initState
    // downloadPdf(
    //          widget.link)
    //     .then((value) {
    //   setState(() {
    //     spin = false;
    //   });
    // });
    // _bytesImage = Base64Decoder().convert(_base64);
    super.initState();

    // Base64Decoder().convert(_imgString);
  }

  Future<Uint8List> _capturePng() async {
    try {
      // print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      final result = await ImageGallerySaver.saveImage(pngBytes);
      // print(pngBytes);
      // print(bs64);
     //print(result);
      setState(() {});
      Fluttertoast.showToast(msg: "File downloaded Successfully");
      return pngBytes;
    } catch (e) {
      print(e);
    }

    // RenderRepaintBoundary boundary =
    // _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    // ui.Image image = await boundary.toImage();
    // ByteData byteData = await (image.toByteData(format: ui.ImageByteFormat.png) as FutureOr<ByteData>);
    // if (byteData != null) {
    //   final result =
    //   await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
    //   print(result);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleSpacing: 60,
        // backgroundColor: Colors.grey.shade200,
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
              color: Colors.white,
            )),
        toolbarHeight: 80,
        title: Text("View File",
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
          // spin
          //     ? Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          Stack(
        children: <Widget>[
          Container(
              child: Stack(children: [
            // PDFView(
            //   filePath: pdf.path,
            //   enableSwipe: true,
            //   swipeHorizontal: true,
            //   autoSpacing: false,
            //   pageFling: true,
            //   pageSnap: true,
            //   defaultPage: currentPage,
            //   fitPolicy: FitPolicy.BOTH,
            //   preventLinkNavigation:
            //   false, // if set to true the link is handled in flutter
            //   onRender: (_pages) {
            //     setState(() {
            //       pages = _pages;
            //       isReady = true;
            //     });
            //   },
            //   onError: (error) {
            //     setState(() {
            //       errorMessage = error.toString();
            //     });
            //     print(error.toString());
            //   },
            //   onPageError: (page, error) {
            //     setState(() {
            //       errorMessage = '$page: ${error.toString()}';
            //     });
            //     print('$page: ${error.toString()}');
            //   },
            //   onViewCreated: (PDFViewController pdfViewController) {
            //     _controller.complete(pdfViewController);
            //   },
            //   onLinkHandler: (String uri) {
            //     print('goto uri: $uri');
            //   },
            //   onPageChanged: (int page, int total) {
            //     print('page change: $page/$total');
            //     setState(() {
            //       currentPage = page;
            //     });
            //   },
            // ),
            // SfPdfViewer.network(
            //   'https://livereceipts.blob.core.windows.net/receipts/FeeReceipt_RCT-002524101202014970655914.PDF',
            // ),
            // errorMessage.isEmpty
            //     ? !isReady
            //     ? Center(
            //   child: CircularProgressIndicator(),
            // )
            //     : Container()
            //     : Center(
            //   child: Text(errorMessage),
            // )
            RepaintBoundary(
              key: _globalKey,
              child: SfPdfViewer.network(
                widget.link,
              ),
            )
          ])),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 75.0,
        height: 75.0,
        child: FloatingActionButton(
          onPressed: _capturePng,
          child: const Icon(Icons.download,size:34),
          backgroundColor: kColorGreen,
        ),
      )

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
