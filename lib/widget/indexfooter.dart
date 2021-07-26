import 'package:flutter/material.dart';
List<Widget> indexFooter() {

  return <Widget>[
    RichText(
        text:TextSpan(
        children: [
                TextSpan(
                text: 'Language',
                  ),
                TextSpan(
                  text: 'English',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2682AB),
                  ),
                ),
           ],
          style: TextStyle(fontSize: 15, color: Colors.black),
          ),
    ),
    RichText(
      text:TextSpan(
        children: [
          TextSpan(
            text: 'AL JEEL AL JADEED EDUCATIONAL INST.',
          ),
        ],
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
    )
  ];

}