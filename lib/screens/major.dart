import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastogo/models/product_model.dart';
import 'package:gastogo/screens/summary.dart';
import 'package:gastogo/utility/global_var.dart';
import 'package:gastogo/utility/my_style.dart';

class Major extends StatefulWidget {
  MajorState createState() => MajorState();
}

class MajorState extends State<Major> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getProduct();
    });
  }

  Future<void> getProduct() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot query = await firestore.collection('product').get();
    for (QueryDocumentSnapshot doc in query.docs) {
      final ProductModel product = ProductModel.fromJson(doc.data());
      productList.add(product);
    }
    setState(() {
      productSelected = productList[0];
    });
    debugPrint('$productList');
  }

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
                    if (productList.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          ProductModel product = productList[index];
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print(product.nameTh);
                                setState(() {
                                  productSelected = product;
                                  totalPrice =
                                      product.detail[0].price.toDouble();
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: productSelected.id == product.id
                                      ? Colors.blue[700]
                                      : Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${product.nameTh}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: MyStyle().gastext,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (productList.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          ProductModel product = productList[2 + index];
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print(product.nameTh);
                                setState(() {
                                  productSelected = product;
                                  totalPrice =
                                      product.detail[0].price.toDouble();
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: productSelected.id == product.id
                                      ? Colors.blue[700]
                                      : Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${product.nameTh}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: MyStyle().gastext,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
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
                    borderRadius: BorderRadius.circular(10)),
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
                    if (productSelected != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          double price =
                              productSelected.detail[index].price.toDouble();
                          int size = productSelected.detail[index].size;
                          String unit = productSelected.sizeUnit;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('$size $unit');
                                setState(() {
                                  sizeSelected = size;
                                  totalPrice = price;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: sizeSelected == size
                                      ? Colors.blue[700]
                                      : Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '$size $unit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: MyStyle().gastext,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    if (productSelected != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          double price = productSelected.detail[index + 2].price
                              .toDouble();
                          int size = productSelected.detail[index + 2].size;
                          String unit = productSelected.sizeUnit;
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                print('$size $unit');
                                setState(() {
                                  sizeSelected = size;
                                  totalPrice = price;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                decoration: BoxDecoration(
                                  color: sizeSelected == size
                                      ? Colors.blue[700]
                                      : Colors.blue[300],
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '$size $unit',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: MyStyle().gastext,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              ),
              ////// คำนวณราคา
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Text(
                      'ToTal $totalPrice Bath',
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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
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
