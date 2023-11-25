import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'notice1.dart';
import 'notice2.dart';
import 'notice3.dart';

class NoticeList extends StatelessWidget {

  // 공지 DB 여기에다 추가하면 될듯
  final List<String> noticeTitles = [
    "[건강마루멤버십028] 건강습관만들기 - 식단관리 교육 자료 : 당류 (★건강마루멤버십 회원전용)",
    "[건강마루멤버십029] 7월 이벤트 걷기미션 안내(★건강마루멤버십 회원전용)",
    "[건강마루멤버십030] 7월 이벤트 걷기미션 결과발표",
    "[건강마루멤버십031] 8월 이벤트 걷기미션 안내(★건강마루멤버십 회원전용)",
    "[건강마루멤버십032] 건강습관만들기 - 식단관리 교육 자료 : 영양표시 (★건강마루멤버십 회원전용)",
    "[건강마루멤버십033] 8월 이벤트 걷기미션 결과발표",
    "[건강마루멤버십034] 9~10월 이벤트 걷기미션 안내(★건강마루멤버십 회원전용)",
  ];

  // 공지사항 작성일, 조회수 목록
  final List<Map<String, String>> noticeInfo = [
    {
      'date': "2023-07-13",
      "view": "329",
    },
    {
      'date': "2023-07-21",
      "view": "357",
    },
    {
      'date': "2023-08-04",
      "view": "290",
    },
    {
      'date': "2023-08-28",
      "view": "333",
    },
    {
      'date': "2023-09-05",
      "view": "227",
    },
    {
      'date': "2023-09-07",
      "view": "202",
    },
    {
      'date': "2023-09-22",
      "view": "208",
    },
  ];

  final List<Widget> noticePage = [
    NoticePage1(),
    NoticePage2(),
    NoticePage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: WidgetAppBar(title: "공지사항"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: List.generate(
            3,
            (index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: 10, right: 10, bottom: 20, top: index == 0 ? 20 : 0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x33000000),
                        offset: Offset(3, 3),
                      )
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => noticePage[index],
                          settings: RouteSettings(
                            arguments: {
                              'title': noticeTitles[index],
                              'date': noticeInfo[index]['date']!,
                              'view': noticeInfo[index]['view']!,
                              'index': index,
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              noticeTitles[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    noticeInfo[index]['date']!,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "조회수 : " + noticeInfo[index]['view']!,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

