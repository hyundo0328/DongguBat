import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../screens/my_page.dart';
import 'widget_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetBottomNavigationBar extends StatefulWidget {
  @override
  State<WidgetBottomNavigationBar> createState() =>
      _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  bool _isDrawerOpen = false;
  // Drawer의 상태를 저장할 변수
  SharedPreferences? _prefs;

  // SharedPreferences 초기화 및 Drawer 상태 복원
  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  // SharedPreferences 초기화
  _initSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _isDrawerOpen = _prefs!.getBool('isDrawerOpen') ?? false;
    if (_isDrawerOpen) {
      _openDrawer();
    }
  }

  // Drawer 열기
  void _openDrawer() {
    setState(() {
      _isDrawerOpen = true;
    });
    _prefs?.setBool('isDrawerOpen', true); // Drawer 상태를 저장
    Scaffold.of(context).openDrawer();
  }

  // Drawer 닫기
  void _closeDrawer() {
    setState(() {
      _isDrawerOpen = false;
    });
    _prefs?.setBool('isDrawerOpen', false); // Drawer 상태를 저장
    Navigator.of(context).pop();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        // 열려 있는 경우 Drawer를 닫습니다.
        if (_isDrawerOpen) {
          _closeDrawer();
        } else {
          _openDrawer();
        }
      }
    });
  }

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
          _onItemTapped;
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
