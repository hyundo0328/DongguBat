import 'package:flutter/material.dart';

class WidgetAppBar extends StatelessWidget {
  final String title; // Add a title parameter

  WidgetAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    if (title == '프로그램 신청') {
      // If the title is "프로그램 신청", add the search icon to actions
      actions.add(
        Padding(
          padding: EdgeInsets.only(right: 10.0), // Adjust the padding as needed
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
              // You can navigate to a search page or perform any other action here
            },
          ),
        ),
      );
    }

    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      title: Text(title),
      actions: actions, // Use the title parameter
    );
  }
}
