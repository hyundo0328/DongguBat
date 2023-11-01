import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String content;
  final Function onClick;

  PostCard({required this.title, required this.content, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Text(content),
        onTap: () {
          onClick();
        },
      ),
    );
  }
}
