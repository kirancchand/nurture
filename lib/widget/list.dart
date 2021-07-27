import 'package:flutter/material.dart';



class StudentList extends StatelessWidget {
  StudentList({
    Key key,
    // this.txt,
    // this.data
  }) : super(key: key);
  // String txt;
  // Response data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.pink.shade300,
          // backgroundImage: AssetImage(img),
        ),
        title: Text("Asim Muhammad"),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Student Id 849302hjk",
              style: TextStyle(fontSize: 11),
            ),
            Text("Al Mina aljadeed", style: TextStyle(fontSize: 11))
          ],
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.green,
          ),
        ));
  }
}


class OutstandingPayment extends StatelessWidget {
  OutstandingPayment({
    Key key,
    // this.txt,
    // this.data
  }) : super(key: key);
  // String txt;
  // Response data;
  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        leading: Checkbox(
          value: false,
          onChanged: (value) {
            /* setState(() {
                this.asim = value!;
              });*/
          },
          side: BorderSide(color: Colors.green),
          shape: CircleBorder(),
          activeColor: Colors.green,
        ),
        title: Text("Asim Muhammad", style: TextStyle(color: Colors.grey)),
        selected: true,
        horizontalTitleGap: 1,
        trailing: Text("300 KD", style: TextStyle(color: Colors.grey)),
      );
  }
}

