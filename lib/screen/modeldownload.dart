import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ModelDownload extends StatefulWidget {
  ModelDownload({Key key}) : super(key: key);
  String paymentid=Get.arguments[0];
  String filepath=Get.arguments[1];

  @override
  _ModelDownloadState createState() => _ModelDownloadState();
}

class _ModelDownloadState extends State<ModelDownload> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
   String paymentid=Get.arguments[0];
  String filepath=Get.arguments[1];



  Future<bool> savePaymentFile(String url, String fileName) async {
    print("sdfdsf${Get.arguments[0]}");
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/medrasaty";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
              setState(() {
                progress = value1 / value2;
              });
            });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await savePaymentFile(
        widget.filepath,
        "${widget.paymentid}.pdf");
    if (downloaded) {
      Fluttertoast.showToast(msg:"File Downloaded");
    } else {
      print("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
       Container(
         child: Center(
            child: loading
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: SpinKitWave(color: Colors.blue, type: SpinKitWaveType.center),)
                : TextButton.icon(
                icon: Icon(
                  Icons.download_rounded,
                  color: Colors.red
                ),
               // color: Colors.blue,
                onPressed: downloadFile,
               // padding: const EdgeInsets.all(10),
                label: Text(
                  "Download File",
                  style: TextStyle(color: Colors.red,fontSize: 25),
                )
                ),
          
      
    ),
       );
  }
}