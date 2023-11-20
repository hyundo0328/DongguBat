import 'package:flutter/material.dart';

class PhoneNumberChangePage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();

  void _handleChangePhoneNumber() {
    // 여기에 전화번호 변경 로직을 구현하세요.
    String newPhoneNumber = _phoneNumberController.text;
    // 변경된 전화번호를 서버에 업데이트하거나 로컬 저장소에 저장하는 등의 작업을 수행하세요.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화번호 변경'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: '새로운 전화번호'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleChangePhoneNumber,
              child: Text('전화번호 변경'),
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
