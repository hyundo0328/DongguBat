import 'package:flutter/material.dart';
import '../screens/main_page.dart';

class WidgetAppBar extends StatelessWidget {
  final String title; // Add a title parameter

  WidgetAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    List<Widget> actions = [];

    if (title == '프로그램 신청') {
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
    } else if (title == '공지사항') {
      actions.add(
        Padding(
          padding: EdgeInsets.only(right: 10.0), // Adjust the padding as needed
          child: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
        ),
      );
    }

    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
      actions: actions, // Use the title parameter
    );
  }
}
