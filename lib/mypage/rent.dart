import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';

class MyRentPageScreen extends StatefulWidget {
  @override
  State<MyRentPageScreen> createState() => _MyRentPageScreenState();
}

class _MyRentPageScreenState extends State<MyRentPageScreen> {
  final List<String> buildingList = [
    "금호4가동 주민센터",
    "마장동 주민센터",
    "응봉동 주민센터",
    "금호4가동 주민센터",
  ];

  // 대관장소 DB 여기에다 추가하면 될듯
  final List<String> placeList = [
    "5층 공유부엌",
    "다목적실",
    "소희의실",
    "5층 공유부엌",
  ];

  // 대관날짜 DB 여기에다 추가하면 될듯
  final List<String> dateList = [
    "2023년 11월 30일",
    "2023년 10월 30일",
    "2023년 11월 25일",
    "2023년 12월 05일",
  ];

  // 대관시간 DB 여기에다 추가하면 될듯
  final List<String> timeList = [
    "12:00 ~ 14:00",
    "14:00 ~ 18:00",
    "15:00 ~ 16:00",
    "10:00 ~ 12:00",
  ];

  // 상태 DB 여기에다 추가하면 될듯
  final List<Map<String, dynamic>> stateList = [
    {
      "state": "접수 완료",
      "color": Colors.green,
    },
    {
      "state": "이용 완료",
      "color": Colors.grey,
    },
    {
      "state": "신청 반려",
      "color": Colors.red,
    },
    {
      "state": "신청 취소",
      "color": Colors.black,
    },
  ];

  // 사용인원 DB 여기에다 추가하면 될듯
  final List<String> memberList = ["5", "3", "8", "2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppBar(title: "나의 시설대관 현황"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
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
                      '4',
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
                        '신청 취소',
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
                        '이용 완료',
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
                placeList.length,
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
                          // 날짜
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                            child: Container(
                              child: Text(
                                dateList[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          // 구분선
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Divider(
                              height: 2,
                              thickness: 1,
                              color: Colors.black54,
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
                            child: Row(
                              children: [
                                Text(
                                  "신청자명 : 김동구", // 회원명 불러와서 추가하기 가능..?
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "전화번호 : 010-1234-5678", // 회원 전화번호 불러와서 추가하기 가능..?
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // 신청장소
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              "사용장소 : " +
                                  buildingList[index] +
                                  " | " +
                                  placeList[index],
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          // 신청 시간
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text(
                              "사용시간 : " + timeList[index],
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                              ),
                            ),
                          ),

                          // 신청 인원
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 15),
                            child: Text(
                              "신청 인원 : " + memberList[index],
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
