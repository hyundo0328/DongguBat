import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';

class MyProgramPageScreen extends StatefulWidget {
  @override
  State<MyProgramPageScreen> createState() => _MyProgramPageScreenState();
}

class _MyProgramPageScreenState extends State<MyProgramPageScreen> {
  final List<String> titleList = [
    "2023년 ICT 콤플렉스 원포인트 MENTORING",
    "제 1회 성동구 반려동물 축제",
    "[제 4기 성동구협치회의] 민간위원 모집 공고",
  ];

  // 상태 DB 여기에다 추가하면 될듯
  final List<Map<String, dynamic>> stateList = [
    {
      "state": "접수 완료",
      "color": Colors.green,
    },
    {
      "state": "활동 완료",
      "color": Colors.grey,
    },
    {
      "state": "신청 반려",
      "color": Colors.red,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppBar(title: "나의 프로그램 현황"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '전체',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '접수 완료',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '신청 반려',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        '활동 완료',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Expanded(
            child: ListView(
              children: List.generate(
                titleList.length,
                (index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: 20, top: index == 0 ? 20 : 0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                          bottom: BorderSide(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 프로그램명
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                            child: Container(
                              child: Text(
                                titleList[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          // 신청 상태
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                            child: Text(
                              stateList[index]['state'],
                              style: TextStyle(
                                color: stateList[index]['color'],
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // 신청자 정보
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Text(
                              "신청자명 : 김동구", // 회원명 불러와서 추가하기 가능..?
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Text(
                              "전화번호 : 010-1234-5678", // 회원 전화번호 불러와서 추가하기 가능..?
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 15, 15),
                            child: Text(
                              "이메일 : donggubat@dongguk.edu.kr", // 회원 전화번호 불러와서 추가하기 가능..?
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
