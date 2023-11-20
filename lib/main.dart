//main.dart
import 'package:flutter/material.dart';
import 'login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final db = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "first": "id",
    "last": "email",
    "born": "password",
    "Pnum": "Pnum",
    "address": "address",
    "name": "name",
  };
  // Add a new document with a generated ID
  db.collection("users_test").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));
  runApp(MyApp());
}


// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DongguBat',
      home: LogIn(),
    );
  }
}