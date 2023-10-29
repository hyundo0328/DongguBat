import 'package:flutter/material.dart';

class PostCardDetails extends StatefulWidget {
  final String title;

  PostCardDetails({required this.title});

  @override
  _PostCardDetailsState createState() => _PostCardDetailsState();
}

class _PostCardDetailsState extends State<PostCardDetails> {
  final TextEditingController commentController = TextEditingController();
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                // 게시물 내용 표시
                Text('게시물 내용을 여기에 표시합니다.'),
                // 댓글 목록 표시
                for (var comment in comments) Text(comment),
              ],
            ),
          ),
          // 댓글 작성 입력 필드 및 버튼
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(labelText: '댓글 작성'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      comments.add(commentController.text);
                      commentController.clear();
                    });
                  },
                  child: Text('댓글 작성'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
