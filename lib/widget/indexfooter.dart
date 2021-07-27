import 'package:flutter/material.dart';

List<Widget> indexFooter() {
  return <Widget>[
    SizedBox(height: 70,),
    Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Language:  ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "English  ",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                    size: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " AL JEEL AL JADEED EDUCATIONAL INST.",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    ),
    SizedBox(height:52),
   ];
}
