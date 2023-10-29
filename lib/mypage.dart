// mypage.dart
import 'package:donggu_bat/main_page.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MyPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: AppBar(
          title: Text('마이페이지'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 96, 68),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('내 마이페이지 화면입니다.'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPage()),
                  );
                },
                child: Text('새로운 화면으로 이동'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 10),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '목록'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
          ],
          currentIndex: 2,
          onTap: (int index) {
            if (index == 0) {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            } else if (index == 2) {
              // '마이페이지' 아이콘을 클릭한 경우 마이페이지 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPageScreen()),
              );
            }
          },
        ));
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새로운 화면'),
      ),
      body: Center(
        child: Text('새로운 화면입니다.'),
      ),
    );
  }
}
