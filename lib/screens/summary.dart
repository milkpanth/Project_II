import 'package:flutter/material.dart';
import 'package:gastogo/screens/order.dart';
import 'package:gastogo/screens/showmap.dart';
import 'package:gastogo/screens/status.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/utility/global_var.dart';

class Summary extends StatefulWidget {
  SummaryState createState() => SummaryState();
}

class SummaryState extends State<Summary> {
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot query = await firestore.collection('product').get();
    for (QueryDocumentSnapshot doc in query.docs) {
      final ProductModel product = ProductModel.fromJson(doc.data());
      productList.add(product);
    }
    // setState(() {
    //   productSelected = productList[0];
    // });
    debugPrint('$productList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการสินค้าที่สั่งซื้อ'),
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.lightBlue[200],
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'รายการสั่งซื้อ',
                              style: TextStyle(
                                color: MyStyle().darktextColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '- ${productSelected.nameTh} $sizeSelected kg. $totalPrice bath',
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                color: MyStyle().gastext,
                                fontSize: 18,
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'รวมราคาทั้งหมด $totalPrice บาท',
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: MyStyle().gastext,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      width: 250.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyStyle().buttonColor,
                        ),
                        onPressed: () async {
                          //await loginwithfirebase();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowMap(),
                              // builder: (context) => ShowMap(),
                            ),
                          );
                        },
                        child: Text(
                          'เพิ่มสถานที่จัดส่ง',
                          style: TextStyle(color: MyStyle().lighttextColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                height: 50.0,
                width: 250.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    FirebaseFirestore firestore = FirebaseFirestore.instance;
                    final now = new DateTime.now();

    firestore
        .collection('Order')
        .add({
          'user': "${userData.uID}",
          'fullName': "${userData.fullName}", // nicha
          'product': "${productSelected.nameTh}", // nicha@gmail.com
          'size': "$sizeSelected", // password
          'sizeUnit': "${productSelected.sizeUnit}", // 0637966241
          'mark': {
            "lat": markLocation.latitude,
            "long":markLocation.longitude
          }, // user or shop
          'orderDate': now.toIso8601String()
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
                     setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StatusOrder()),
                    );
                  });
                  },
                  child: Text(
                    'ยืนยันการส่ังซื้อ',
                    style: TextStyle(
                        color: MyStyle().darktextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,),
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
