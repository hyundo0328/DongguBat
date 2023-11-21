import 'package:flutter/material.dart';

class MyProgramPageScreen extends StatefulWidget {
  @override
  State<MyProgramPageScreen> createState() => _MyProgramPageScreenState();
}

class _MyProgramPageScreenState extends State<MyProgramPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('나의 프로그램 신청 현황'),
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
