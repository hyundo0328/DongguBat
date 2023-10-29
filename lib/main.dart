//main.dart
import 'package:flutter/material.dart';
import 'login.dart';
import 'mypage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DongguBat',
      home: LogIn(),
    );
  }
}

class Main extends StatelessWidget {
  // const Main({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
          appBar: AppBar(
            title: Text('메인페이지'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 44, 96, 68),

            // leading : 아이콘 버튼이나 간단한 위젯을 왼쪽에 배치할 때 사용

            // actions : 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("search button is clicked");
                },
              ),
            ],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/vertical_symnbol.jpg'),
                ),
                accountName: Text('hyundo'),
                accountEmail: Text('hyundo13@naver.com'),
                onDetailsPressed: () {
                  print('arrow is clicked');
                },
              ),
            ],
          )),
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
            onTap: (int index) {
              if (index == 0) {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                } else {
                  scaffoldKey.currentState!.openDrawer();
                }
              } else if (index == 1) {
                // '홈' 아이콘을 클릭한 경우 홈 화면으로 이동
                // Navigator.push(
                //   context
                //   MaterialPageRoute(
                //     builder: (BuildContext context) => HomeScreen(),
                //   ),
                // );
              } else if (index == 2) {
                // '마이페이지' 아이콘을 클릭한 경우 마이페이지 화면으로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPageScreen()),
                );
              }
            },
          )),
    );
  }
}
