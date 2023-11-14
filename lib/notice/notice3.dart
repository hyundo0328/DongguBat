import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';

class NoticePage3 extends StatelessWidget {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
        child: WidgetAppBar(title: "공지사항3 제목"),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
        child: Column(
          children: [Text("공지사항3 내용")],
        ),
      ),
    );
  }
}
