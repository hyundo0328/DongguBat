import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../screens/my_page.dart';

class WidgetBottomNavigationBar extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: scaffoldKey,
      type: BottomNavigationBarType.fixed,
      iconSize: 35,
      selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 10),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '목록'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],
      currentIndex: 1,
      onTap: (int index) {
        if (index == 0) {
          final scaffoldState = scaffoldKey.currentState;
          if (scaffoldState != null) {
            scaffoldState.openDrawer();
          }
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyPageScreen()),
          );
        }
      },
      // currentIndex와 onTap 핸들러는 사용하는 페이지에 따라 변경할 수 있습니다.
    );
  }
}
