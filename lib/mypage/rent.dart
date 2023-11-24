import 'package:flutter/material.dart';

class MyRentPageScreen extends StatefulWidget {
  @override
  State<MyRentPageScreen> createState() => _MyRentPageScreenState();
}

class _MyRentPageScreenState extends State<MyRentPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 시설대관현황'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(),
          ),
        ),
      ),
    );
  }
}
