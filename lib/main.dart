//main.dart
import 'package:flutter/material.dart';
import 'login/login.dart';

void main() {
  runApp(MyApp());
}

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


// class MyApp extends StatelessWidget {
//   // 여기에서 로그인 여부를 확인하는 로직을 작성합니다.
//   bool isLoggedIn = false; // 사용자가 로그인한 여부를 저장하는 변수

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: isLoggedIn ? MainPage() : LoginScreen(),
//     );
//   }
// }