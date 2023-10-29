//main.dart
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'login.dart';
import 'mypage.dart';
import 'communicate.dart';
import 'mypage.dart';
import 'program_rent.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // const Main({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = [
    Expanded(
        child: Container(
      child: Image.asset("assets/세이프 라이딩.jpg"),
    )),
    Expanded(
        child: Container(
      child: Image.asset("assets/플로깅플레져.jpg"),
    )),
    Expanded(
        child: Container(
      child: Image.asset("assets/SNS 인증샷.jpg"),
    )),
  ];

  int _currentPage = 0;
  int tmp = 0;
  int _numberOfPages = 1000000; // 페이지 수
  int _milliseconds = 10000; // 넘어가는 간격 (2초)

  @override
  void initState() {
    super.initState();
    // 타이머를 사용하여 페이지 자동으로 넘기기
    Timer.periodic(Duration(milliseconds: 2000), (Timer timer) {
      _currentPage++;
      _currentPage = _currentPage % 3;
      // print(_currentPage);

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
          appBar: AppBar(
            title: Text('동구밭'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 44, 96, 68),
            toolbarHeight: 60,
            // leading : 아이콘 버튼이나 간단한 위젯을 왼쪽에 배치할 때 사용

            // actions : 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
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
                          builder: (BuildContext context) => program_apply()));
                },
              ),
            ],
          )),
          body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: PageView.builder(
                                controller: _pageController,

                                onPageChanged: (int page) {
                                  setState(() {
                                    _activePage = page;
                                  });
                                },
                                //itemCount: _pages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return _pages[index % _pages.length];
                                },
                              ),
                            ),
                            Positioned(
                              height: 200,
                              bottom: 5,
                              left: 0,
                              right: 0,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  verticalDirection: VerticalDirection.down,
                                  children: List<Widget>.generate(
                                      _pages.length,
                                      (index) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: InkWell(
                                              onTap: () {
                                                _pageController.animateToPage(
                                                    index,
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.easeIn);
                                              },
                                              child: CircleAvatar(
                                                radius: 3,
                                                backgroundColor:
                                                    _activePage == index
                                                        ? Colors.grey
                                                        : Colors.grey
                                                            .withOpacity(0.5),
                                              ),
                                            ),
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // 원하는 둥근 정도를 설정합니다.
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text('2'),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 8.0),
                                  padding: EdgeInsets.all(8.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // 원하는 둥근 정도를 설정합니다.
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text('2'),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              })),
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
            currentIndex: 1,
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

  Widget buildBanner(String text, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // 원하는 둥근 정도를 설정합니다.
        color: Colors.blueGrey,
      ),
      child: Center(child: Text(text)),
    );
  }
}
