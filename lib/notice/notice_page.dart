import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'notice1.dart';

class Notice extends StatelessWidget {
  final List<String> noticeTitles = [
    "공지사항 1 제목",
    "공지사항 2 제목",
    "공지사항 3 제목",
    "공지사항 4 제목",
    "공지사항 5 제목",
    "공지사항 6 제목",
    "공지사항 7 제목",
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
          children: List.generate(noticeTitles.length, (index) {
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
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoticePage1()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noticeTitles[index],
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "공지 요약 내용",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
