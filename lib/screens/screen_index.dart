import 'package:donggu_bat/tabs/tab_home.dart';
import 'package:donggu_bat/tabs/tab_list.dart';
import 'package:donggu_bat/tabs/tab_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {

  @override
  _IndexScreenState createState() {
    return _IndexScreenState();
  }
}

class _IndexScreenState extends State<IndexScreen> {

  int _currentIndex = 0;

  final List<Widget> tabs = [
    TabList(),
    TabHome(),
    TabProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /* 다음을 시도해 보세요: 여기서 색상을 특정 색상 (예: Colors.amber)으로 변경하고 핫 리로드를 실행하여 
           다른 색상은 그대로 유지되는 동안 AppBar의 색상이 변경되는지 확인하세요.*/
        backgroundColor: Color.fromARGB(255, 0, 151, 66),
        // 여기서는 App.build 메서드에 의해 생성된 MyHomePage 객체에서 값을 가져와 앱바 제목을 설정합니다.
        title: const Text('메인페이지')
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 40,
        selectedItemColor: const Color.fromARGB(255, 0, 151, 66),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontSize: 12),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '목록'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
        ],
      ),
      body: tabs[_currentIndex],
    );
  }
}