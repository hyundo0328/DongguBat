import 'package:flutter/material.dart';
import 'mypage.dart';

class program_apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return MaterialApp(
      home: Scaffold(
        // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
        appBar: AppBar(
          title: Text('program_rent'),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 35,
          selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 10),
          currentIndex: _currentIndex,
          onTap: (int index) {
            // onTap 이벤트를 처리하고 적절한 페이지로 이동
            if (index == 0) {
              // '목록' 페이지로 이동
            } else if (index == 1) {
              // '홈' 페이지로 이동
            } else if (index == 2) {
              // '마이페이지' 페이지로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPageScreen()),
              );
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '목록'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '마이페이지',
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              '당신을 위한 추천 (Recommand for You)',
              style: TextStyle(fontSize: 24),
            ),
            Image.asset(
              'assets/image.png', // Replace with your image asset path
              width: 500,
              height: 100,
            ),
            Text(
              '대관 신청 (Rental Application)',
              style: TextStyle(fontSize: 24),
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
              style: TextStyle(fontSize: 24),
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
      ),
    );
  }
}
