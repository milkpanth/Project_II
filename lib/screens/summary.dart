import 'package:flutter/material.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/utility/global_var.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:gastogo/screens/showmap.dart';

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
                              height: 22,
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
                    Container(
                      padding: EdgeInsets.all(25),
                      // child: Image.asset(
                      //   'images/logo.jpg',
                      //   height: 200,
                      //   width: 200,
                      //),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
