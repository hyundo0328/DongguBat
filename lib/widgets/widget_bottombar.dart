import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../screens/my_page.dart';
import '../screens/program_rent.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class WidgetBottomNavigationBar extends StatefulWidget {
  @override
  State<WidgetBottomNavigationBar> createState() =>
      _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // _pageController = PageController(initialPage: 0);

  int _selectedIndex = 1;

  final List<Widget> tabs = [ProgramApply(), MainPage(), MyPageScreen()];

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }

  // Drawer의 상태를 저장할 변수
  // SharedPreferences? _prefs;

  // SharedPreferences 초기화 및 Drawer 상태 복원
  @override
  void initState() {
    super.initState();
    // _initSharedPreferences();
  }

  // SharedPreferences 초기화
  // _initSharedPreferences() async {
  //   _prefs = await SharedPreferences.getInstance();
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      iconSize: 35,

      selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 10),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.event), label: '프로그램'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],

      currentIndex: _selectedIndex,
      onTap: (int index) {
        if (index == 0) {
          _onItemTapped(index);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => tabs[index]),
          );
        } else if (index == 1) {
          _onItemTapped(index);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => tabs[index]),
          );
        } else if (index == 2) {
          _onItemTapped(index);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => tabs[index]),
          );
        }
      },
    );
  }
}
