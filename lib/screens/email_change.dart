import 'package:flutter/material.dart';

class EmailChangePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  void _handleChangeEmail() {
    // 여기에 이메일 주소 변경 로직을 구현하세요.
    String newEmail = _emailController.text;
    // 여기다 DB
    // 변경된 이메일 주소를 서버에 업데이트하거나 로컬 저장소에 저장하는 등의 작업을 수행하세요.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이메일 주소 변경'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '새로운 이메일 주소'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleChangeEmail,
              child: Text('이메일 주소 변경'),
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
