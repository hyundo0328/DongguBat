import 'package:flutter/material.dart';
import 'package:donggu_bat/widget/Postcard.dart';
import 'postcardmaking.dart';
import 'postcarddetails.dart';

class Communicate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('소통'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 96, 68),
        ),
        body: ListView(
          children: <Widget>[
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[프로그램] ICT콤플렉스 원포인트 멘토링 같이해요!',
                content: '멘토링 같이하실 분 구합니다.',
                onClick: () {
                  Navigator.of(context)
                      .pushNamed('/postcarddetails', arguments: '첫 번째 게시물');
                },
              );
            }),
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[식료품 구매] 1인 가구 양파 구매하는데 같이 구매하실 분?',
                content: '양파가 너무 많아요 한망이 크니 같이 구매해서 나눕시다.',
                onClick: () {
                  Navigator.of(context)
                      .pushNamed('/postcarddetails', arguments: '두 번째 게시물');
                },
              );
            }),
            Builder(builder: (BuildContext context) {
              return PostCard(
                title: '[시설대관] 공유주방에서 함께 요리 해요',
                content: '자취방에서 요리하니깐 너무 냄새빼기 힘드네요. 같이 요리하고 요리한 음식 나눔해요~',
                onClick: () {
                  Navigator.of(context)
                      .pushNamed('/postcarddetails', arguments: '세 번째 게시물');
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
        ));
  }
}
