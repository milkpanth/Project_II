import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/utility/global_var.dart';
import 'package:gastogo/utility/my_style.dart';

class StatusOrder extends StatefulWidget {
  StatusOrderState createState() => StatusOrderState();
}

class StatusOrderState extends State<StatusOrder> {
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
        title: Text('Status Order'),
      ),
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
                style: TextStyle(
                    color: MyStyle().darktextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text('รอทางร้านจัดส่งแก๊สหุงต้ม',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    //fontWeight: FontWeight.bold
                  )),
            ]),
      ]),
    );
  }
}
