import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  OrderState createState() => OrderState();
}

class OrderState extends State<Order> {
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
        title: Text('รายการสินค้า'),
      ),
    ),
    );
    }
  }

}