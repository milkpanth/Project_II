import 'package:flutter/material.dart';
import 'package:gastogo/utility/my_style.dart';

class Promote extends StatefulWidget {
  PromoteState createState() => PromoteState();
}

class PromoteState extends State<Promote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //title: Text('สั่งซื้อสินค้า'),
      // ),
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.all(25),
          child: Image.asset(
            'images/logo.jpg',
            height: 200,
            width: 200,
          ),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'GastoGo Application',
              ),
              Text('พร้อมให้บริการแล้ววันนี้ พร้อมส่วนลดสุดพิเศษ'),
            ]),
      ]),
    );
  }
}
