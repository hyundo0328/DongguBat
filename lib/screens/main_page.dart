//main.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import '../notice/notice_page.dart';
import '../notice/notice1.dart';
import '../notice/notice2.dart';
import '../notice/notice3.dart';
import 'main_banner.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // const Main({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 1;

  String? cityName;
  int? temp;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // 상태가 해제된 위젯에서 setState를 호출하지 않도록 타이머를 취소합니다.
    super.dispose();
  }

  _launchURL(String url) {
    if (url.isNotEmpty) {
      launch(url);
    } else {
      print("없는 주소");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "동구밭"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 6),
                    child: Text(
                      '지금 성동구에선?',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                BannerPage(),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Text(
                              "공지사항 (Notice)",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          trailing: Padding(
                            padding: EdgeInsets.all(5),
                            child: IconButton(
                              icon: Icon(Icons.keyboard_arrow_right),
                              iconSize: 25,
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Notice()),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Divider(
                            height: 2,
                            thickness: 0.8,
                            color: Colors.black38,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black38, // 아래 테두리의 색상 설정
                                  width: 1.0, // 아래 테두리의 두께 설정
                                ),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoticePage1()),
                                );
                              },
                              child: Container(
                                width: double.infinity, // 가로 길이를 화면에 꽉 채우는 역할
                                child: Text(
                                  "공지사항 1 제목",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black38, // 아래 테두리의 색상 설정
                                  width: 1.0, // 아래 테두리의 두께 설정
                                ),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NoticePage2()),
                                );
                              },
                              child: Container(
                                width: double.infinity, // 가로 길이를 화면에 꽉 채우는 역할
                                child: Text(
                                  "공지사항 2 제목",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoticePage3()),
                              );
                            },
                            child: Container(
                              width: double.infinity, // 가로 길이를 화면에 꽉 채우는 역할
                              child: Text(
                                "공지사항 3 제목",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Divider()
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 6),
                    child: Text(
                      '상담바로가기',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _makePhoneCall('0222817715');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      child: Counseling(
                        icon: Icons.phone_android,
                        text: '전화연결',
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _sendEmail('sungdong9solo@daum.net');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      child: Counseling(
                        icon: Icons.email_outlined,
                        text: 'E-mail',
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _openKakaoTalkChannel('_gThpb');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      child: Counseling(
                        icon: Icons.chat_bubble_outline,
                        text: '카카오톡',
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: WidgetBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

void _makePhoneCall(String phoneNumber) async {
  String telScheme = 'tel:$phoneNumber';
  if (await canLaunch(telScheme)) {
    await launch(telScheme);
  } else {
    throw 'Could not launch $telScheme';
  }
}

void _sendEmail(String email) async {
  final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunch(_emailLaunchUri.toString())) {
    await launch(_emailLaunchUri.toString());
  } else {
    throw 'Could not launch email';
  }
}

void _openKakaoTalkChannel(String channelID) async {
  final String kakaotalkScheme = 'kakaotalk://';

  final Uri _channelLink = Uri(
    scheme: 'kakaotalk',
    path: 'open',
    queryParameters: <String, dynamic>{
      'url': 'http://pf.kakao.com/_gThpb',
    },
  );

  if (await canLaunch(kakaotalkScheme)) {
    await launch(_channelLink.toString());
  } else {
    throw 'Could not launch KakaoTalk';
  }
}

class PageInfo {
  final String imageUrl;
  final String linkUrl;

  PageInfo({required this.imageUrl, required this.linkUrl});
}

class Counseling extends StatelessWidget {
  final IconData icon;
  final String text;

  Counseling({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            this.icon,
            size: 40,
          ),
        ),
        Text(
          '${this.text}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
