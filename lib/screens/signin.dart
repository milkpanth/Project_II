import 'package:flutter/material.dart';
import 'package:gastogo/screens/major.dart';
// import 'package:gastogo/screens/signingg.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                userForm(),
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
        child: RaisedButton(
          color: MyStyle().buttonColor,
          onPressed: () => setState(() {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Major()));
          }),
          child: Text(
            'Log In',
            style: TextStyle(color: MyStyle().lighttextColor),
          ),
        ),
      );

  // SizedBox buildSizedBox() => SizedBox();

  Widget userForm() => Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_box,
            color: MyStyle().textColor,
          ),
          labelStyle: TextStyle(color: MyStyle().textColor),
          labelText: 'User : ',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().textColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().primaryColor)),
        ),
      ));

  Widget passwordForm() => Container(
      width: 250.0,
      child: TextField(
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

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "barry.allen@example.com",
        password: "SuperSecretPassword!",
      );
      debugPrint('${userCredential.user.toString()}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('Usertable')
        .doc('User')
        .get()
        .then((DocumentSnapshot document) => debugPrint('${document.data()}'));

    firestore
        .collection('Usertable')
        .add({
          //'UID': "${userCredential.user.uid}",
          'full_name': "fullName", // name
          'password': "passworf", // Stokes and Sons
          'phonenumber': "phonenumber" // 0637966241
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
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
