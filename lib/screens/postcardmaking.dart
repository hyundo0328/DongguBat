import 'package:flutter/material.dart';

class PostCardMaking extends StatefulWidget {
  @override
  _PostCardMakingState createState() => _PostCardMakingState();
}

class _PostCardMakingState extends State<PostCardMaking> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시물 작성'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('제목'),
            TextField(
              controller: titleController,
            ),
            SizedBox(height: 10),
            Text('내용'),
            TextField(
              controller: contentController,
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text;
                final content = contentController.text;
                Navigator.of(context).pop({'title': title, 'content': content});
              },
              child: Text('게시물 작성 완료'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 44, 96, 68),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
