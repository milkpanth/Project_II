import 'package:flutter/material.dart';

// class Major extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return SafeArea(
//     //   child: SingleChildScrollView(
//     //     child: Column(children: [
//     //       //SizedBox(height: getProportionateScreenWidth(20),)
//     //       Container(
//     //         margin: EdgeInsets.symmetric(horizontal: 20.0),
//     //       )
//     //     ]),
//     //   ),
//     // );
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       width: double.infinity,
//       height: 90,
//       decoration: BoxDecoration(color: Colors.green[500]),
//     );
//   }
// }

class Major extends StatefulWidget {
  MajorState createState() => MajorState();
}

class MajorState extends State<Major> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Shop"),
      // ),
      body: ListView(
        children: <Widget>[
          headSection,
          //menuSection,
          Column(
            children: <Widget>[
              Container(
                width: 230,
                height: 195,
                //color: Colors.green[200],
                //child: Confirmorder(),
              )
            ],
          )
        ],
      ),
    );
  }
}

var headSection = Container(
  color: Colors.green[200],
  height: 155,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Image.asset(
        // "assets/images/logo.jpg",
        "images/logo.jpg",
        width: 155,
        height: 155,
      ),
      Container(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "GastoGo Parkkret",
              style: TextStyle(fontSize: 20),
            ),
            Text(""),
            Text(
              "Parkket,Nonthaburi,Thailand,11120",
            ),
            // Text(
            //   "Nichachawalee",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            // ),
            // Text(
            //   "Chatwattananon",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            // ),
            // // ชื่อหนูยาว หนูขอแบ่งชื่อจริงกับนามสกุลนะคะ
            // Text(
            //   "6035512029",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            // ),
          ],
        ),
      ),
    ],
  ),
);

var menuSection = Container(
  color: Colors.blue[200],
  height: 400,
  child: ListView(
    scrollDirection: Axis.vertical,
    children: <Widget>[
      Shop1(), Shop2(),
      //Shop3(),Shop4(),Shop5()
    ],
  ),
);

class Shop1 extends StatefulWidget {
  Shop1State createState() => Shop1State();
}

class Shop1State extends State<Shop1> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          "assets/images/Shop1.jpg",
          width: 200,
        ),
        Container(
          width: 170,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Shop1", style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    minWidth: 15,
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                    onPressed: () => setState(() {
                      // if (count1 == 0) {
                      //   count1 = 0;
                      // } else {
                      //   count1--;
                      // }
                    }),
                  ),
                  // Text(
                  //   '$count1',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  // MaterialButton(
                  //   color: Colors.white,
                  //   minWidth: 15,
                  //   child: Icon(Icons.add, size: 15),
                  //   onPressed: () => setState(() {
                  //     count1++;
                  //   }),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Shop2 extends StatefulWidget {
  Shop2State createState() => Shop2State();
}

class Shop2State extends State<Shop2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          "assets/image/Shop1.jpg",
          width: 200,
        ),
        Container(
          width: 170,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Shop1", style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    minWidth: 15,
                    child: Icon(
                      Icons.remove,
                      size: 15,
                    ),
                    onPressed: () => setState(() {
                      // if (count1 == 0) {
                      //   count1 = 0;
                      // } else {
                      //   count1--;
                      // }
                    }),
                  ),
                  // Text(
                  //   '$count1',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  // MaterialButton(
                  //   color: Colors.white,
                  //   minWidth: 15,
                  //   child: Icon(Icons.add, size: 15),
                  //   onPressed: () => setState(() {
                  //     count1++;
                  //   }),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
