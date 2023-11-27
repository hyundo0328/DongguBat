import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class WidgetDrawer extends StatelessWidget {
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


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/vertical_symbol.jpg'),
            ),
            accountName: Text('사용자 이름'),
            accountEmail: Text('사용자 이메일'),
            onDetailsPressed: () {
              // 상세 정보 화면으로 이동하도록 핸들러를 추가할 수 있습니다.
            },
          ),
          // 다른 Drawer 아이템들을 추가할 수 있습니다.
        ],
      ),
    );
  }
}
