import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurture/common/constants.dart';
import 'package:nurture/config/controller.dart';
import 'package:nurture/screen/home1.dart';
import 'package:nurture/screen/paymenthistory.dart';
import 'package:nurture/screen/settingspage.dart';
import 'package:nurture/widget/list.dart';
import 'package:nurture/screen/paymentpending.dart';
import 'package:nurture/screen/myhome.dart';
import 'package:nurture/screen/notification.dart';
import 'package:nurture/model/fee.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title, this.count, this.fee, this.childrens})
      : super(key: key);
  final FeeResponseModel fee;
  final List childrens;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title;
  int count;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  List<Widget> _pages() => [
        // MyHome(),
        HomePage1(fee: widget.fee, childrens: widget.childrens),
        PaymentPending(),
        PaymentHistory(),
        //Notifications()
        SettingsPage()
      ];

  int pageIndex;

  @override
  void initState() {
    widget.count == null ? pageIndex = 0 : pageIndex = widget.count;

    super.initState();

    // print(widget.fee);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = _pages();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
        theme: ThemeData(
            //primarySwatch:Colors.green,
            //  primaryColor: Colors.orange

            ),
        home: Scaffold(
          // appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          // title: Text(widget.title),
          //   ),
          body: pages[pageIndex],
          // body: Center(
          //   // Center is a layout widget. It takes a single child and positions it
          //   // in the middle of the parent.
          //   child: Column(
          //     // Column is also a layout widget. It takes a list of children and
          //     // arranges them vertically. By default, it sizes itself to fit its
          //     // children horizontally, and tries to be as tall as its parent.
          //     //
          //     // Invoke "debug painting" (press "p" in the console, choose the
          //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
          //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          //     // to see the wireframe for each widget.
          //     //
          //     // Column has various properties to control how it sizes itself and
          //     // how it positions its children. Here we use mainAxisAlignment to
          //     // center the children vertically; the main axis here is the vertical
          //     // axis because Columns are vertical (the cross axis would be
          //     // horizontal).
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //         ListView.builder(
          //             itemCount: 3,
          //             shrinkWrap: true,
          //             physics: ClampingScrollPhysics(),
          //             itemBuilder: (context, int index) {
          //               return StudentList();
          //             },
          //           ),
          //       ListView.builder(
          //         itemCount: 3,
          //         shrinkWrap: true,
          //         physics: ClampingScrollPhysics(),
          //         itemBuilder: (context, int index) {
          //           return OutstandingPayment();
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
              //selectedIconTheme: IconThemeData(color: Colors.red),
              onTap: (index) {
                setState(() {
                  pageIndex = index;
                  // print(pageIndex);
                });
              },
              currentIndex: pageIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kColorGreen, //Colors.greenAccent,
              // backgroundColor: Colors.greenAccent,
              // unselectedItemColor: Colors.yellow,

              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 30,
                    ),
                    /* icon: Image.asset(
                "assets/images/icons_png/Home.png",
                ),*/
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.monetization_on_outlined,
                      size: 30,
                    ),
                    /* icon: Image.asset(
                  "assets/images/icons_png/PaymentPending.png",
                ),*/
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.article_outlined,
                      size: 30,
                    ),
                    /* icon: Image.asset(
                  "assets/images/icons_png/PaymentHistory.png",
                ),*/
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      //notifications_none_outlined,
                      size: 30,
                    ),
                    /* icon: Image.asset(
                  "assets/images/icons_png/Notification.png",
                ),*/
                    label: "")
              ]),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
