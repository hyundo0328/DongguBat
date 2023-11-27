//main.dart
import 'package:flutter/material.dart';
import 'login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screens/main_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  // 여기에서 로그인 여부를 확인하는 로직을 작성합니다.
  bool isLoggedIn = false; // 사용자가 로그인한 여부를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DongguBat',
      home: isLoggedIn ? MainPage() : LogIn(),
    );
  }
}


