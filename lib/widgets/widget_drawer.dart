import 'package:flutter/material.dart';

class WidgetDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/vertical_symbol.jpg'),
            ),
            accountName: Text('사용자 이름'),
            accountEmail: Text('사용자 이메일'),
            onDetailsPressed: () {
              // 상세 정보 화면으로 이동하도록 핸들러를 추가할 수 있습니다.
            },
          ),
          // 다른 Drawer 아이템들을 추가할 수 있습니다.
        ],
      ),
    );
  }
}
