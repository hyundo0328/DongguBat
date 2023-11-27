import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'package:donggu_bat/notice/notice_move.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'notice_move.dart';

class NoticePage2 extends StatelessWidget {
  late String title;
  late String date;
  late String view;
  late int index;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (arguments != null) {
      // 값들을 추출합니다.
      title = arguments['title'];
      date = arguments['date'];
      view = arguments['view'];
      index = arguments['index'];
    } else {
      // arguments가 null일 때의 처리를 추가할 수 있습니다.
    }

    ScrollController _scrollController = ScrollController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
        child: WidgetAppBar(title: "공지사항 내용"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 텍스트
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // 날짜 조회수 텍스트
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Row(
                  children: [
                    Text(
                      "작성일 : " + date,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "조회수 : " + view,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),

              // 공지사항 내용 텍스트
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: MediaQuery.of(context).size.width,
                  // height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black38, width: 1.0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('assets/교육지2.jpg'),
                        SizedBox(height: 25),
                        Text.rich(
                          TextSpan(
                            text:
                                "걷기미션은 건강마루멤버십 회원 전용입니다. 일반회원분들은 참여가 불가능합니다!\n\n"
                                "걷기미션 제출 방법은 아래 카카오톡으로 제출해주세요~! (제출기한: 7/31(월) ~ 8/2(수) ) \n\n"
                                "▶ 건강마루 멤버십 카카오톡 제출 링크: \n",
                            style: TextStyle(fontSize: 15),
                            children: [
                              TextSpan(
                                text: "(https://open.kakao.com/o/sFIfee4e)",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // 해당 URL을 여기에서 열 수 있습니다.
                                    launch(
                                        "https://sd1in.net/product/maru-membership");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Divider(
                thickness: 0.7,
                color: Colors.black54,
              ),

              // 공지사항 이동 버튼
              NoticeMove(index: index),
            ],
          ),
        ),
      ),
    );
  }
}
