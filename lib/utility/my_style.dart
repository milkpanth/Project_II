import 'package:flutter/material.dart';

class MyStyle {
  Color textColor = Colors.blue[800];
  Color primaryColor = Colors.green;
  Color buttonColor = Colors.blue[300];
  Color darktextColor = Colors.black;
  Color lighttextColor = Colors.white;

  SizedBox buildSizedBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Text showName(String title) => Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.blue[800],
          fontWeight: FontWeight.bold,
        ),
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.jpg'),
    );
  }

  MyStyle();
}
