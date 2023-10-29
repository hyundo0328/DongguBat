import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageViewWithButtons(),
    );
  }
}

class PageViewWithButtons extends StatefulWidget {
  @override
  _PageViewWithButtonsState createState() => _PageViewWithButtonsState();
}

class _PageViewWithButtonsState extends State<PageViewWithButtons> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  int _numberOfPages = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView with Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _currentPage--;
                      _pageController.animateToPage(_currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_currentPage < _numberOfPages - 1) {
                      _currentPage++;
                      _pageController.animateToPage(_currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeOut);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
