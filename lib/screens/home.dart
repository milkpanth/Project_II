import 'package:flutter/material.dart';
import 'package:gastogo/screens/promote.dart';
import 'package:gastogo/screens/signin.dart';
import 'package:gastogo/screens/signup.dart';
import 'package:gastogo/utility/my_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GastoGo'),
      ),
      drawer: buildDrawer(),
      body: Promote(),
      // body: Row(
      //   children: <Widget>[
      //     Major(),
      //   ],
      // ),
    );
  }

  Drawer buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[buildDrawerHeader(), signinMenu(), signupMenu()],
        ),
      );

  ListTile signinMenu() {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: MyStyle().textColor,
      ),
      title: Text('Sign in'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signupMenu() {
    return ListTile(
      leading: Icon(
        Icons.person_add,
        color: MyStyle().textColor,
      ),
      title: Text('Sign up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

//   UserAccountsDrawerHeader buildDrawerHeader() => UserAccountsDrawerHeader(
//       accountName: Text('Guest'), accountEmail: Text('Please log in'));
// }

  UserAccountsDrawerHeader buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jpg'), fit: BoxFit.cover)),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        'Guest',
        style: TextStyle(
          color: MyStyle().darktextColor,
        ),
      ),
      accountEmail: Text('Please log in',
          style: TextStyle(
            color: MyStyle().darktextColor,
          )),
    );
  }
}
