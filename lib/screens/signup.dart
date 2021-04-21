// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Sign up", style: TextStyle(color: Colors.white)),
//         ),
//         body: Container(
//             //color: Colors.green[50],
//             child: Center(
//           child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 //gradient: LinearGradient(
//                 //colors: [Colors.yellow[100], Colors.green[100]])
//               ),
//               margin: EdgeInsets.all(32),
//               padding: EdgeInsets.all(24),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   buildTextFieldUser(),
//                   buildTextFieldName(),
//                   buildTextFieldPassword(),
//                   buildTextFieldPhonenumber(),
//                   buildButtonSignUp(context)
//                 ],
//               )),
//         )));
//   }
// }

// Container buildButtonSignUp(BuildContext context) {
//   return Container(
//       constraints: BoxConstraints.expand(height: 50),
//       child: Text("Sign up",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 18, color: Colors.white)),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16), color: Colors.blue[600]),
//       margin: EdgeInsets.only(top: 16),
//       padding: EdgeInsets.all(12));
// }

// Container buildTextFieldUser() {
//   return Container(
//       padding: EdgeInsets.all(12),
//       decoration: BoxDecoration(
//           color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
//       child: TextField(
//           decoration: InputDecoration.collapsed(hintText: "Username"),
//           keyboardType: TextInputType.emailAddress,
//           style: TextStyle(fontSize: 18)));
// }

// Container buildTextFieldName() {
//   return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(top: 12),
//       decoration: BoxDecoration(
//           color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
//       child: TextField(
//           obscureText: true,
//           decoration: InputDecoration.collapsed(hintText: "Name"),
//           style: TextStyle(fontSize: 18)));
// }

// Container buildTextFieldPassword() {
//   return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(top: 12),
//       decoration: BoxDecoration(
//           color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
//       child: TextField(
//           obscureText: true,
//           decoration: InputDecoration.collapsed(hintText: "Password"),
//           style: TextStyle(fontSize: 18)));
// }

// Container buildTextFieldPhonenumber() {
//   return Container(
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.only(top: 12),
//       decoration: BoxDecoration(
//           color: Colors.green[100], borderRadius: BorderRadius.circular(16)),
//       child: TextField(
//           obscureText: true,
//           decoration: InputDecoration.collapsed(hintText: "Phone number"),
//           style: TextStyle(fontSize: 18)));
// }

import 'package:flutter/material.dart';
import 'package:gastogo/utility/my_style.dart';
import 'package:gastogo/utility/normal_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType;
  String name, email, password;
  String phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().buildSizedBox(),
          showAppName(),
          MyStyle().buildSizedBox(),
          nameForm(),
          MyStyle().buildSizedBox(),
          emailForm(),
          MyStyle().buildSizedBox(),
          passwordForm(),
          MyStyle().buildSizedBox(),
          phoneForm(),
          MyStyle().buildSizedBox(),
          userRadio(),
          shopRadio(),
          MyStyle().buildSizedBox(),
          registerButton(),
        ],
      ),
    );
  }

  Widget registerButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().buttonColor,
          onPressed: () async {
            print(
                'name = $name, email = $email, password = $password, phonenumber = $phonenumber, choosType = $chooseType');
            if (name == null ||
                name.isEmpty ||
                email == null ||
                email.isEmpty ||
                password == null ||
                password.isEmpty ||
                phonenumber == null ||
                phonenumber.isEmpty) {
              print('กรุณากรอกข้อมูลให้ครบด้วยค่ะ');
              normalDialog(context, 'กรุณากรอกข้อมูลให้ครบด้วยค่ะ');
            }
            await signupwithfirebase();
          },
          child: Text(
            'Register',
            style: TextStyle(color: MyStyle().lighttextColor),
          ),
        ),
      );

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'User',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'User (ผู้สั่งซื้อ)',
                  style: TextStyle(color: MyStyle().darktextColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 'Shop',
                  groupValue: chooseType,
                  onChanged: (value) {
                    setState(() {
                      chooseType = value;
                    });
                  },
                ),
                Text(
                  'Shop (ร้านค้า)',
                  style: TextStyle(color: MyStyle().darktextColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => name = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.face_outlined,
                    //Icons.account_box,
                    color: MyStyle().textColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().textColor),
                  labelText: 'Name : ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().textColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget emailForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => email = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    //Icons.account_box,
                    color: MyStyle().textColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().textColor),
                  labelText: 'E-mail : ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().textColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => password = value.trim(),
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    //Icons.account_box,
                    color: MyStyle().textColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().textColor),
                  labelText: 'Password : ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().textColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 250.0,
              child: TextField(
                onChanged: (value) => phonenumber = value.trim(),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    //Icons.account_box,
                    color: MyStyle().textColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().textColor),
                  labelText: 'Phone number : ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().textColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              )),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showName('GastoGo'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );

  Future<void> signupwithfirebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: "$email",
        password: "$password",
      );
      debugPrint('${userCredential.user.toString()}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore
        .collection('User')
        .add({
          'UID': "${userCredential.user.uid}",
          'fullName': "$name", // nicha
          'email': "$email", // nicha@gmail.com
          'password': "$password", // password
          'phoneNumber': "$phonenumber", // 0637966241
          'chooseType': "$chooseType" // user or shop
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
