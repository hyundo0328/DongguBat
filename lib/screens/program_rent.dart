import 'package:donggu_bat/widgets/widget_bottombar.dart';
import 'package:flutter/material.dart';
import 'my_page.dart';
import 'communicate.dart';
import '../main.dart';
import 'main_page.dart';

class ProgramApply extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return MaterialApp(
      home: Scaffold(
        // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
        appBar: AppBar(
          title: Text('프로그램 대관'),
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
            ListTile(
              title: Text('소통'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Communicate()));
              },
            ),
            ListTile(
              title: Text('프로그램/대관'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ProgramApply()));
              },
            ),
          ],
          )),
        body: Column(
          children: [
            Text(
              '당신을 위한 추천 (Recommand for You)',
              style: TextStyle(fontSize: 20),
            ),
            Image.asset(
              'assets/image.png', // Replace with your image asset path
              width: 500,
              height: 100,
            ),
            Text(
              '대관 신청 (Rental Application)',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 300, // 가로 크기 설정
              height: 250, // 세로 크기 설정
              color: Color.fromARGB(255, 197, 197, 197),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: GridView.extent(
                maxCrossAxisExtent: 100, // 각 아이템의 최대 가로 크기
                crossAxisSpacing: 5, // 가로 간격 설정
                mainAxisSpacing: 2, // 세로 간격 설정
                children: List.generate(15, (index) {
                  // 각 아이템에 다른 텍스트 추가
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text('$index'), // 아이템마다 다른 텍스트 표시
                    ),
                  );
                }),
              ),
            ),
            Text(
              '월간 프로그램 안내 (Monthly Program)',
              style: TextStyle(fontSize: 20),
            ),
            Container(
              // 가로 크기 설정
              height: 50, // 세로 크기 설정
              color: Color.fromARGB(255, 197, 197, 197),
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // 수평 스크롤
                itemCount: 10, // 가로로 10개의 아이템
                itemBuilder: (BuildContext context, int index) {
                  // 각 아이템에 다른 내용 추가 가능
                  return Container(
                    width: 100, // 각 아이템의 가로 크기 설정
                    color: Colors.white, // 각 아이템의 배경색
                    child: Center(
                      child: Text('$index'), // 아이템마다 다른 텍스트 표시
                    ),
                  );
                },
              ),
            )
          ],
        ),
          bottomNavigationBar: WidgetBottomNavigationBar()
      ),
    );
  }
}
