import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'notice1.dart';
import 'notice2.dart';
import 'notice3.dart';

class NoticeList extends StatefulWidget {
  @override
  _NoticeListState createState() => _NoticeListState();
}

class _NoticeListState extends State<NoticeList> {
  List<String> titles = [];
  late Set<Map<String, String>> notice = {};
  @override
  void initState() {
    super.initState();
    notice = {};
    titles = [];
    get_notice(); // 페이지가 로딩될 때 호출
  }

  void get_notice() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('notice').get();

      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (QueryDocumentSnapshot document in documents) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // 가져온 데이터 활용 예시 "이름", "일정", "카테고리"
        String title = data['title'];
        String date = data['date'];
        String text = data['text'];

        notice.add({'name': title, 'time': date, 'location': text});
        String newValue = title; // 새로 추가하려는 값

        // 리스트에 값이 이미 있는지 확인
        if (!titles.contains(newValue)) {
          // 리스트에 추가
          titles.add(newValue);
        }
        // 원하는 작업 수행
        // print('문서 ID: $documentId, 일정: $scheduleData');
        // 이 부분에서 가져온 데이터를 저장하거나 활용할 수 있습니다.
      }
      //print(programDayExist);
      print(titles);
    } catch (error) {
      print('데이터 가져오기 실패: $error');
    }
  }

  // 공지 DB 여기에다 추가하면 될듯

  // 공지사항 작성일, 조회수 목록

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
                              'title': titles[index],
                              'date': notice.elementAt(index)['time'] ?? '',
                              'location':
                                  notice.elementAt(index)['location'] ?? '',
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
                              titles[index],
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
                                    notice.elementAt(index)['time'] ?? '',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "조회수 : ", // + noticeInfo[index]['view']!,
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
