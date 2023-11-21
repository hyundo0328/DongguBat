import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../screens/main_page.dart';

class RecommandPage extends StatefulWidget {
  @override
  State<RecommandPage> createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  bool check_body = false;
  bool check_mind = false;
  bool check_relationship = false;
  bool check_finance = false;
  bool check_support = false;
  bool check_nothing = false;

  final List<bool> check = <bool>[false, false, false, false, false];

  final List<String> checklist = <String>[
    '몸 건강',
    '마음 건강',
    '관계 건강',
    '재무 건강',
    "지원사업",
    "관심없음"
  ];

  final List<String> check_image = <String>[
    'assets/sport.jpeg',
    'assets/health.jpeg',
    'assets/friendly.jpeg',
    'assets/finance.jpeg',
    'assets/book.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
        child: WidgetAppBar(title: "맞춤 추천 설정"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_body = !check_body;
                        });
                        print(check_body);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_body ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.0), // 테두리의 radius 값
                            child: Image.asset(
                              'assets/sport.jpeg',
                              width:
                                  (MediaQuery.of(context).size.width - 80) / 3,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (check_body)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0, // 체크 아이콘의 크기 조절
                              ),
                            ),
                          Positioned(
                            child: Opacity(
                              opacity: check_body ? 0.0 : 1.0,
                              child: Text(
                                '몸 건강',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_mind = !check_mind;
                        });
                        print(check_mind);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_mind ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.0), // 테두리의 radius 값
                            child: Image.asset(
                              'assets/health.jpeg',
                              width:
                                  (MediaQuery.of(context).size.width - 80) / 3,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (check_mind)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0, // 체크 아이콘의 크기 조절
                              ),
                            ),
                          Positioned(
                            child: Opacity(
                              opacity: check_mind ? 0.0 : 1.0,
                              child: Text(
                                '마음 건강',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_relationship = !check_relationship;
                        });
                        print(check_relationship);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_body ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.0), // 테두리의 radius 값
                            child: Image.asset(
                              'assets/friendly.jpeg',
                              width:
                                  (MediaQuery.of(context).size.width - 80) / 3,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (check_relationship)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0, // 체크 아이콘의 크기 조절
                              ),
                            ),
                          Positioned(
                            child: Opacity(
                              opacity: check_relationship ? 0.0 : 1.0,
                              child: Text(
                                '관계 건강',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_finance = !check_finance;
                        });
                        print(check_finance);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_finance ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.0), // 테두리의 radius 값
                            child: Image.asset(
                              'assets/finance.jpeg',
                              width:
                                  (MediaQuery.of(context).size.width - 80) / 3,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (check_finance)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0, // 체크 아이콘의 크기 조절
                              ),
                            ),
                          Positioned(
                            child: Opacity(
                              opacity: check_finance ? 0.0 : 1.0,
                              child: Text(
                                '재무 건강',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_support = !check_support;
                        });
                        print(check_support);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_support ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(4.0), // 테두리의 radius 값
                            child: Image.asset(
                              'assets/book.jpeg',
                              width:
                                  (MediaQuery.of(context).size.width - 80) / 3,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (check_support)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0, // 체크 아이콘의 크기 조절
                              ),
                            ),
                          Positioned(
                            child: Opacity(
                              opacity: check_support ? 0.0 : 1.0,
                              child: Text(
                                '지원사업',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (check_body) {
                          check_body = !check_body;
                        }
                        if (check_mind) {
                          check_mind = !check_mind;
                        }
                        if (check_relationship) {
                          check_relationship = !check_relationship;
                        }
                        if (check_finance) {
                          check_finance = !check_finance;
                        }
                        if (check_support) {
                          check_support = !check_support;
                        }
                        setState(() {
                          check_nothing = !check_nothing;
                        });
                        print(check_nothing);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_nothing ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 80) / 3,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          if (check_nothing)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          // 텍스트를 클릭 시 숨기도록 변경
                          Positioned(
                            child: Opacity(
                              opacity: check_nothing ? 0.0 : 1.0,
                              child: Text(
                                '관심없음',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 96, 68),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  '설정 완료하기',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
