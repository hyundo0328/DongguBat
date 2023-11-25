import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




//사실상 이 페이지는 필요가 없을 것 같긴 함...! -> 이메일이 아이디 역할을 하게 되어버려가지구...

class EmailChangePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  //1125 hys 추가 - uid 및 DB에서 현재 로그인한 사용자 정보 불러오기 
  String? current_uid = FirebaseAuth.instance.currentUser?.uid;  //사용자 uid
  String? current_email = FirebaseAuth.instance.currentUser?.email;  //사용자 이메일
  String? current_name = FirebaseAuth.instance.currentUser?.displayName;  //사용자 이름
  String? current_photo = FirebaseAuth.instance.currentUser?.photoURL;   //사용자 프로필 사진 주소(기본 설정 : 'assets/profile.png')
  String? current_address;  //사용자 주소
  String? current_recommandlist;  //사용자 선호 프로그램 목록 

  //위에서 정의한 current 유저 정보 변수들에 DB에서 문서 읽어와 값 할당 
  void set_current() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    // 문서가 존재하는지 확인
    if (documentSnapshot.exists) {
      // 문서의 데이터 가져오기
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      current_address = data['address'];
      current_recommandlist = data['recommand_list'];

    }
    else{
      print("error : 문서가 존재하지 않습니다!");
    }
  }
  
  

  void _handleChangeEmail() {
    // 여기에 이메일 주소 변경 로직을 구현하세요.
    set_current();  //hys 1125 추가, 자동으로 currunt user 값들 세팅하기 위한 함수
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
