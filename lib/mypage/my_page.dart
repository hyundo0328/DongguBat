// mypage.dart
import 'package:donggu_bat/login/login.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import 'rent.dart';
import 'program.dart';
import 'user_profile.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> rent = [
    {'place': '금호4가동 주민센터 | 5층 공유부엌', 'time': '10월 10일', 'state': '접수 완료'},
    {'place': '마장동 주민센터 | 다목적실', 'time': '10월 06일', 'state': '이용 완료'},
    {'place': '응봉동 주민센터 | 소회의실', 'time': '10월 01일', 'state': '신청 반려'},
    {'place': '금호4가동 주민센터 | 5층 공유부엌', 'time': '09월 17일', 'state': '신청 취소'},
  ];

  List<Map<String, String>> program = [
    {'name': '2023년 ICT 콤플렉스 원포인트 MENTORING', 'state': '접수 완료'},
    {'name': '제 1회 성동구 반려동물 축제', 'state': '마감'},
    {'name': '[제 4기 성동구협치회의] 민간위원 모집 공고', 'state': '결과 확인'},
  ];

  int _selectedIndex = 2;

  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 사용자가 다이얼로그 외부를 탭하면 닫히지 않도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('로그아웃 하시겠습니까?'),
          content: Text('로그아웃 하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: Text('아니오'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('예'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "마이페이지"),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/user_profile.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.00, 0.00),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.00, -1.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 5, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 15, 0),
                                          child: Text(
                                            '김동구 님',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Readex Pro'),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(75, 20),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              backgroundColor: Colors.white,
                                              side: BorderSide(
                                                  color: Color(0xFFC2C2C2),
                                                  width: 1),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserProfilePage()),
                                              );
                                            },
                                            child: Text(
                                              "내 정보 수정",
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 0, 0, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(75, 20),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              backgroundColor: Colors.white,
                                              side: BorderSide(
                                                  color: Color(0xFFC2C2C2),
                                                  width: 1),
                                            ),
                                            onPressed: () {
                                              _showConfirmationDialog(context);
                                            },
                                            child: Text(
                                              "로그아웃",
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 11,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 5, 20),
                                    child: Text('이메일 : donggubat@dgu.kr',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFC2C2C2),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1.0),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text("포인트"),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                                child: Text(
                                  '시설대관 현황',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyRentPageScreen()),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Text(
                                    '전체보기',
                                    style: TextStyle(
                                      color: Colors
                                          .grey, // Set the color you desire
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                            child: Divider(
                              height: 2,
                              thickness: 0.8,
                              color: Colors.black38,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: rent.length,
                            itemBuilder: (BuildContext context, int index) {
                              Color statusColor = Colors.black; // Default color
                              String status = rent[index]['state'] ?? '';

                              if (status == '접수 완료') {
                                statusColor = Colors.green;
                              } else if (status == '이용 완료') {
                                statusColor = Colors.grey;
                              } else if (status == '신청 반려') {
                                statusColor = Colors.red;
                              } else if (status == '신청 취소') {
                                statusColor = Colors.black;
                              }

                              return ListTile(
                                title: Text(
                                  '${rent[index]['place'] ?? ''}',
                                  style: TextStyle(
                                      color: const Color.fromRGBO(
                                          0, 0, 0, 1)), // For place and time
                                ),
                                trailing: Text(
                                  rent[index]['state'] ?? '',
                                  style: TextStyle(color: statusColor),
                                ),
                                subtitle: Text(
                                  '이용시간: ${rent[index]['time'] ?? ''} | 상태: ${rent[index]['state'] ?? ''}',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1.0),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 0, 0),
                                child: Text(
                                  '프로그램 신청현황',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyProgramPageScreen()),
                                  );
                                  // Handle the action when "View All" button is pressed
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  child: Text(
                                    '전체보기',
                                    style: TextStyle(
                                      color: Colors
                                          .grey, // Set the color you desire
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Divider(
                              height: 2,
                              thickness: 0.8,
                              color: Colors.black38,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: program.length,
                            itemBuilder: (BuildContext context, int index) {
                              Color statusColor = Colors.black; // Default color
                              String status = program[index]['state'] ?? '';

                              if (status == '접수 완료') {
                                statusColor = Colors.green;
                              } else if (status == '마감') {
                                statusColor = Colors.grey;
                              } else if (status == '신청 반려') {
                                statusColor = Colors.red;
                              } else if (status == '결과 확인') {
                                statusColor = Colors.blue;
                              }

                              return ListTile(
                                title: Text(
                                  '${program[index]['name'] ?? ''}',
                                  style: TextStyle(
                                      color: const Color.fromRGBO(
                                          0, 0, 0, 1)), // For place and time
                                ),
                                trailing: Text(
                                  rent[index]['state'] ?? '',
                                  style: TextStyle(color: statusColor),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
