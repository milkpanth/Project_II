import 'package:flutter/material.dart';
import 'package:gastogo/screens/major.dart';
// import 'package:gastogo/screens/signingg.dart';
import 'package:gastogo/utility/my_style.dart';

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
