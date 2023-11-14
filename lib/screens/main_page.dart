//main.dart
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import '../widgets/widget_drawer.dart';
import '../notice/notice_page.dart';
import '../notice/notice1.dart';
import '../notice/notice2.dart';
import '../notice/notice3.dart';
import 'dart:async';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // const Main({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;

  ScrollController _scrollController = ScrollController();

  int _activePage = 0;
  int _currentPage = 0;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    // 타이머를 사용하여 페이지 자동으로 넘기기
    _timer = Timer.periodic(Duration(milliseconds: 2000), (Timer timer) {
      _currentPage++;
      _currentPage = _currentPage % 3;

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // 상태가 해제된 위젯에서 setState를 호출하지 않도록 타이머를 취소합니다.
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "동구밭"),
        ),
        // drawer: WidgetDrawer(),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 6),
                  child: Text(
                    '당신을 위한 추천 (Recommand for you)',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 145,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    PageView(
                      // controller: _pageController,
                      controller: _pageController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (int page) {
                        setState(() {
                          _activePage = page;
                        });
                      },
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/SNS 인증샷.jpg',
                              width: double.infinity,
                              height: 130,
                              fit: BoxFit.contain,
                              alignment: Alignment(0.00, -1.00),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/세이프 라이딩.jpg',
                              width: double.infinity,
                              height: 130,
                              fit: BoxFit.contain,
                              alignment: Alignment(0.00, -1.00),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, -1.00),
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/플로깅플레져.jpg',
                              width: double.infinity,
                              height: 130,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      // heightFactor: 190,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          verticalDirection: VerticalDirection.down,
                          children: List<Widget>.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    child: InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(index,
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeIn);
                                      },
                                      child: CircleAvatar(
                                        radius: 3,
                                        backgroundColor: _activePage == index
                                            ? Colors.grey
                                            : Colors.grey.withOpacity(0.7),
                                      ),
                                    ),
                                  )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 7),
                  child: Text(
                    '공지사항 (Notice)',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45, width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      // title: Text(
                      //   "공지사항",
                      //   style: TextStyle(fontSize: 17),
                      // ),
                      trailing: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        iconSize: 25,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Notice()),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black45, // 아래 테두리의 색상 설정
                              width: 1.5, // 아래 테두리의 두께 설정
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticePage1()),
                            );
                          },
                          child: Text(
                            "공지사항 1 제목",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black45, // 아래 테두리의 색상 설정
                              width: 1.5, // 아래 테두리의 두께 설정
                            ),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticePage2()),
                            );
                          },
                          child: Text(
                            "공지사항 2 제목",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NoticePage3()),
                          );
                        },
                        child: Text(
                          "공지사항 3 제목",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 7),
                  child: Text(
                    '성동구 날씨 (Seongdong\'s Weather)',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
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
