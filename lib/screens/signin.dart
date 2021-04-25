import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastogo/models/user_model.dart';
import 'package:gastogo/screens/major.dart';
import 'package:gastogo/utility/global_var.dart';
// import 'package:gastogo/screens/signingg.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String chooseType;
  String name, email, password;
  String phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Container(
        //decoration: BoxDecoration(
        //gradient: RadialGradient(
        // colors: <Color>[Colors.white, MyStyle().primaryColor],
        // ),
        //),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().buildSizedBox(),
                MyStyle().showName('GastoGo'),
                MyStyle().buildSizedBox(),
                emailForm(),
                MyStyle().buildSizedBox(),
                //buildSizedBox(),
                passwordForm(),
                MyStyle().buildSizedBox(),
                loginButton(),
                // LoginWithGoogle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyStyle().buttonColor,
          ),
          onPressed: () async {
            await loginwithfirebase();
            if (userData.chooseType == 'Shop') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Major(), //ไปที่แสดงข้อมูลออเดอร์ที่เข้ามา
                  // builder: (context) => ShowMap(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Major(),
                  // builder: (context) => ShowMap(),
                ),
              );
            }
          },
          child: Text(
            'Log In',
            style: TextStyle(color: MyStyle().lighttextColor),
          ),
        ),
      );

  // SizedBox buildSizedBox() => SizedBox();

  Widget emailForm() => Container(
      width: 250.0,
      child: TextField(
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_box,
            color: MyStyle().textColor,
          ),
          labelStyle: TextStyle(color: MyStyle().textColor),
          labelText: 'E-mail : ',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));

  Widget passwordForm() => Container(
      width: 250.0,
      child: TextField(
        onChanged: (val) {
          setState(() {
            password = val;
          });
        },
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: MyStyle().textColor,
          ),
          labelStyle: TextStyle(color: MyStyle().textColor),
          labelText: 'Password : ',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));

  Future<void> loginwithfirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await auth.signOut();
    UserCredential userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: "$email",
        password: "$password",
      );
      debugPrint('${userCredential.user.toString()}');
    } on FirebaseAuthException catch (e) {
      debugPrint('$e');
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    QuerySnapshot query = await firestore
        .collection('User')
        .where('UID', isEqualTo: userCredential.user.uid)
        .get();
    userData = UserModel.fromJson(query.docs.first.data());
    debugPrint('${userData.toJson()}');
  }
}

//Widget loginwithGoogleButton() => Container(
//      width: 250.0,
//      child: RaisedButton(
//        color: MyStyle().buttonColor,
//        onPressed: () {},
//        child: Text(
//         'Login with Google',
//          style: TextStyle(color: MyStyle().lighttextColor),
//        ),
//      ),
//    );
