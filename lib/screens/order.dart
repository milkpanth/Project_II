import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/utility/global_var.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gastogo/screens/showmap.dart';

class OrderShop extends StatefulWidget {
  OrderShopState createState() => OrderShopState();
}

class OrderShopState extends State<OrderShop> {
  @override
  // void initState() {
  //   super.initState();
  //   getOrder();
  // }

  // Future<void> getProduct() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   QuerySnapshot query = await firestore.collection('Order').get();
  //    for (QueryDocumentSnapshot doc in query.docs) {
  //     final OrderModel order = OrderModel.fromJson(doc.data());
  //     orderList.add(order);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการสินค้า'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              //'$size $unit',
              'รายการสินค้าที่ลูกค้าสั่งซื้อ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: MyStyle().gastext,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            //decoration: BoxDecoration(
            //gradient: RadialGradient(
            // colors: <Color>[Colors.white, MyStyle().primaryColor],
            // ),
            //),
            child: Text(
              //'$size $unit',
              // 'ชื่อลูกค้า : ${userData.fullName}',
              'ชื่อลูกค้า : nicha',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: MyStyle().gastext,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              //'$size $unit',
              'ชื่อสินค้า : ${productSelected.nameTh}',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: MyStyle().gastext,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              //'$userData',
              //'$size $unit',
              //'$productSelected'
              'ขนาด : $sizeSelected kg.',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: MyStyle().gastext,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'ราคารวม : $totalPrice',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: MyStyle().gastext,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),SizedBox(
            height: 15,
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 30),
          //   child: Text(
          //     'ที่อยู่ลูกค้า : $markLocation',
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: MyStyle().gastext,
          //       fontSize: 18,
          //       //fontWeight: FontWeight.bold
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'ที่อยู่ลูกค้า : $markLocation',
              //textAlign: TextAlign.center,
              style: TextStyle(
                color: MyStyle().gastext,
                fontSize: 18,
                //fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          litMap(),
        ],
      ),
    );
  }
  Container litMap() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
      color: Colors.blue[200],
      height: 200,
    );
  }
}
