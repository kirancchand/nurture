import 'package:flutter/material.dart';
import 'package:nurture/widget/list.dart';

class Student extends StatefulWidget {
  const Student({Key key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height * .3,
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
      Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          //  backgroundImage:AssetImage(assetName)
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Muhammad Nabil",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text("Parent ID: 538939nks52",
            style: TextStyle(
              color: Colors.white,
            )),
        SizedBox(
          height: 15,
        ),
        Container(
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Students"),
                            Text(
                              "Academic year: 2021-2022",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 11),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return StudentList();
                        },
                      ),
                    ])))
      ])
    ]);
  }

}
