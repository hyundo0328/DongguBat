import 'package:donggu_bat/widgets/widget_bottombar.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';

class ProgramApply extends StatefulWidget {
  @override
  State<ProgramApply> createState() => _ProgramApplyState();
}

class _ProgramApplyState extends State<ProgramApply> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return MaterialApp(
      home: Scaffold(
        // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "프로그램 신청"),
        ),
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
        bottomNavigationBar: WidgetBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
