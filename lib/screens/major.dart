import 'package:flutter/material.dart';
import 'package:gastogo/screens/summary.dart';
import 'package:gastogo/utility/my_style.dart';

class Major extends StatefulWidget {
  MajorState createState() => MajorState();
}

class MajorState extends State<Major> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สั่งซื้อสินค้า'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            child: Image.asset(
              'images/logo.jpg',
              height: 200,
              width: 200,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          /////////ยี่ห้อ
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[200],
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'ยี่ห้อ',
                          style: TextStyle(
                              color: MyStyle().gastext,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('ยูนิคแก๊ส');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'ยูนิคแก๊ส',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('สยามแก๊ส');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'สยามแก๊ส',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('ปตท');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'ปตท',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('เวิลด์แก๊ส');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'เวิลด์แก๊ส',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /////ขนาด
              Container(
                width: MediaQuery.of(context).size.width * .8,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  border: Border.all(),
                ),
                //width: 200,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'ขนาด',
                          style: TextStyle(
                              color: MyStyle().gastext,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('4 กก.');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                border: Border.all(),
                              ),
                              child: Text(
                                '4 กก.',
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('7 กก.');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                border: Border.all(),
                              ),
                              child: Text(
                                '7 กก.',
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('15 กก.');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                border: Border.all(),
                              ),
                              child: Text(
                                '15 กก.',
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('48 กก.');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                border: Border.all(),
                              ),
                              child: Text(
                                '48 กก.',
                                style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ////// คำนวณราคา
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      'ToTal ............. Bath',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              /////// ปุ่มตระกร้า
              // Container(
              //   padding: EdgeInsets.all(5),
              //   child: Column(
              //     children: <Widget>[
              //       FlatButton(
              //         onPressed: () => Navigator.pop(context),
              //         child: Text(
              //           'เพิ่มสินค้าลงตะกร้า',
              //           style: TextStyle(
              //               color: MyStyle().darktextColor, fontSize: 20),
              //         ),
              //         color: Colors.blue,
              //         height: 50,
              //       ),
              //     ],
              //   ),
              // )
              Container(
                height: 50.0,
                width: 250.0,
                child: RaisedButton(
                  //color: MyStyle().buttonColor,
                  color: Colors.blue,
                  onPressed: () => setState(() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Summary()));
                  }),
                  child: Text(
                    'สั่งซื้อสินค้า',
                    style: TextStyle(
                        color: MyStyle().darktextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
