import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/widget_appbar.dart';

class FindIDPW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "아이디/비밀번호 찾기"),
        ),
        body: Align(
          child: ButtonBar(
            // 버튼 바
            // alignment: MainAxisAlignment.center, // 중앙 정렬
            buttonPadding: EdgeInsets.fromLTRB(0, 0, 0, 0), // 버튼의 패딩 주기
            children: [
              TextButton(
                onPressed: () {
                  // print('회원가입 버튼');
                },
                child: Text('회원가입'),
                style: TextButton.styleFrom(primary: Colors.black45),
              ),
              TextButton(
                // 텍스트버튼에 아이콘 넣기
                onPressed: () {
                  // print('ID/PW 버튼');
                },
                child: Text('ID/PW 찾기'),
                style: TextButton.styleFrom(primary: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
