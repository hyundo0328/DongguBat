import 'package:flutter/material.dart';
import '../widgets/Postcard.dart';
import 'postcardmaking.dart';
import 'postcarddetails.dart';
import 'login.dart';
import 'mypage.dart';
import 'program_rent.dart';
import '../main.dart';
import 'main_page.dart';

class Communicate extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('소통'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 96, 68),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/vertical_symnbol.jpg'),
              ),
              accountName: Text('hyundo'),
              accountEmail: Text('hyundo13@naver.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
            ),
            ListTile(
              title: Text('소통'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Communicate()));
              },
            ),
            ListTile(
              title: Text('프로그램/대관'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => program_apply()));
              },
            ),
          ],
        )),
        body: ListView(
          children: <Widget>[
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[프로그램] ICT콤플렉스 원포인트 멘토링 같이해요!',
                content: '멘토링 같이하실 분 구합니다.',
                onClick: () {
                  Navigator.of(context).pushNamed('screens/postcarddetails',
                      arguments: '첫 번째 게시물');
                },
              );
            }),
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[식료품 구매] 1인 가구 양파 구매하는데 같이 구매하실 분?',
                content: '양파가 너무 많아요 한망이 크니 같이 구매해서 나눕시다.',
                onClick: () {
                  Navigator.of(context).pushNamed('screens/postcarddetails',
                      arguments: '두 번째 게시물');
                },
              );
            }),
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[프로그램] 공유주방에서 함께 요리 해요',
                content: '자취방에서 요리하니깐 너무 냄새빼기 힘드네요. 같이 요리하고 요리한 음식 나눔해요~',
                onClick: () {
                  Navigator.of(context).pushNamed('screens/postcarddetails',
                      arguments: '세 번째 게시물');
                },
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PostCardMaking()));
          },
          child: Icon(Icons.add),
          backgroundColor: const Color.fromARGB(255, 44, 96, 68),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openDrawer();
              } else {
                scaffoldKey.currentState!.closeDrawer();
              }
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MainPage(),
                ),
              );
            } else if (index == 2) {
              // '마이페이지' 아이콘을 클릭한 경우 마이페이지 화면으로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyPageScreen()),
              );
            }
          },
        ));
  }
}
