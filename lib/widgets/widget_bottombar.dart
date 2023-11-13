import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../screens/my_page.dart';
import '../screens/program_rent.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class WidgetBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  WidgetBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<WidgetBottomNavigationBar> createState() =>
      _WidgetBottomNavigationBarState();
}

class _WidgetBottomNavigationBarState extends State<WidgetBottomNavigationBar> {
  final List<Widget> tabs = [ProgramApply(), MainPage(), MyPageScreen()];

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      iconSize: 32,
      selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(fontSize: 11),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.event), label: '프로그램'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
      ],
      currentIndex: widget.selectedIndex,
      onTap: (int index) {
        if (index != widget.selectedIndex) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => tabs[index]),
          );
        }
      },
    );
  }
}
