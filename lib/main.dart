//main.dart
import 'package:flutter/material.dart';
import 'package:donggu_bat/screens/screen_index.dart';
import 'package:donggu_bat/screens/screen_login.dart';
// import 'package:donggu_bat/screens/screen_splash.dart';
import 'package:donggu_bat/tabs/tab_home.dart';
import 'package:donggu_bat/tabs/tab_list.dart';
import 'package:donggu_bat/tabs/tab_profile.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '성동구 1인가구 지원센터',
      routes: {
        '/index': (context) => IndexScreen(),
        '/login': (context) => LoginScreen(),
        // '/splash': (context) => SplashScreen(),
      },
      initialRoute: '/splash',
    );
  }
}