import 'package:flutter/material.dart';
import 'package:gastogo/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseAuth auth = FirebaseAuth.instance;
  // try {
  //   final UserCredential userCredential =
  //       await auth.createUserWithEmailAndPassword(
  //     email: "barry.allen@example.com",
  //     password: "SuperSecretPassword!",
  //   );
  //   debugPrint('${userCredential.user.toString()}');
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'weak-password') {
  //     print('The password provided is too weak.');
  //   } else if (e.code == 'email-already-in-use') {
  //     print('The account already exists for that email.');
  //   }
  // } catch (e) {
  //   print(e);
  // }

  /////////////////////// Signin  //////////////////////////////
  // UserCredential userCredential;
  // try {
  //   userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: "barry.allen@example.com",
  //     password: "SuperSecretPassword!",
  //   );
  //   debugPrint('${userCredential.user.toString()}');
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'user-not-found') {
  //     print('No user found for that email.');
  //   } else if (e.code == 'wrong-password') {
  //     print('Wrong password provided for that user.');
  //   }
  // }

  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  // firestore
  //     .collection('Usertable')
  //     .doc('User')
  //     .get()
  //     .then((DocumentSnapshot document) => debugPrint('${document.data()}'));

  // firestore
  //     .collection('Usertable')
  //     .add({
  //       //'UID': "${userCredential.user.uid}",
  //       'full_name': "fullName", // name
  //       'password': "passworf", // Stokes and Sons
  //       'phonenumber': "phonenumber" // 0637966241
  //     })
  //     .then((value) => print("User Added"))
  //     .catchError((error) => print("Failed to add user: $error"));
  // FirebaseFirestore.instance.settings = const Settings(
  //   host: 'localhost:8080',
  //   sslEnabled: false,
  //   persistenceEnabled: false,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GastoGo',
      home: Home(),
    );
  }
}
