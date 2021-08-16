import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class ModelDownload extends StatefulWidget {
  //const ModelDownload({ Key key }) : super(key: key);

  @override
  _ModelDownloadState createState() => _ModelDownloadState();
}

class _ModelDownloadState extends State<ModelDownload> {
  final imgUrl =
      "http://www.africau.edu/images/default/sample.pdf";
  bool downloading = false;
  var progressString = "";
  @override
  void initState() {
   // getPermission();
    super.initState();
    downloadFile();
  }
  //get storage permission
 // void getPermission() async {
 //   await PermissionHandler().requestPermissions([PermissionGroup.storage]);
 // }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(imgUrl, "${dir.path}/myimage.pdf",
          onReceiveProgress: (rec, total) {
            if(total !=-1){
              print((rec/total*100).toStringAsFixed(0)+ "%");
            }
        print("received: $rec,Total: $total");
        print('full path :${dir.path}');
        print(progressString);
        setState(() {
          downloading = true;
          
          progressString = (((rec / total*100)/100).toStringAsFixed(0) + "%");
        });
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = "completed";
    });
    print("download completed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("download"),
      ),
      body: Center(
        child: Container(
            child: downloading
                ? Container(
                    color: Colors.grey,
                    height: 120,
                    width: 300,
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          CircularProgressIndicator(),
                          Center(
                              child: Text(
                            "download:$progressString",
                            style: TextStyle(color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  )
                : Text("no data")),
      ),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final imgUrl =
    "https://www.google.com/search?q=images/bg.jpg&rlz=1C1CHBD_enIN750IN750&sxsrf=ALeKk01XQKcLTNsJH8Lkq5GehNbxz47eTw:1629098389548&tbm=isch&source=iu&ictx=1&fir=NQkkXIhO59J_yM%252C4Ho-jJUrxhuMxM%252C_&vet=1&usg=AI4_-kR7L3npmaqTyTYpxy31yngNwFRv3Q&sa=X&ved=2ahUKEwjZisC2gLXyAhXNzjgGHRCHC3UQ9QF6BAgMEAE#imgrc=NQkkXIhO59J_yM";
var dio = Dio();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
                onPressed: () async {
                  var tempDir = await getTemporaryDirectory();
                  String fullPath = tempDir.path + "/boo2.pdf'";
                  print('full path ${fullPath}');

                  Dio dio;
                  download2(dio, imgUrl, fullPath);
                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
               // color: Colors.green,
                //textColor: Colors.white,
                label: Text('Dowload Invoice')),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}*/



