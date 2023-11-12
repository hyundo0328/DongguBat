import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  final String title; // Add a title parameter

  WidgetAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      title: Text(title), // Use the title parameter
    );
  }
}
