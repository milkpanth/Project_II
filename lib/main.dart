import 'package:flutter/material.dart';
import 'package:gastogo/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GastoGo',
      home: Home(),
    );
  }
}
