// mypage.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import 'email_change.dart';
import 'phone_change.dart';
import '../mypage/rent.dart';
import '../mypage/program.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPageScreen extends StatefulWidget {
  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, String>> rent = [
    {'place': '금호4가동 주민센터 | 5층 공유부엌', 'time': '10월 10일', 'state': '접수 완료'},
    {'place': '마장동 주민센터 | 다목적실', 'time': '10월 06일', 'state': '이용 완료'},
    {'place': '응봉동 주민센터 | 소회의실', 'time': '10월 01일', 'state': '신청 반려'},
    {'place': '금호4가동 주민센터 | 5층 공유부엌', 'time': '09월 17일', 'state': '신청 취소'},
  ];

  List<Map<String, String>> program = [
    {'name': '2023년 ICT 콤플렉스 원포인트 MENTORING', 'state': '접수 완료'},
    {'name': '제 1회 성동구 반려동물 축제', 'state': '마감'},
    {'name': '[제 4기 성동구협치회의] 민간위원 모집 공고', 'state': '결과 확인'},
  ];

  int _selectedIndex = 2;

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
          child: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(25, 15, 15, 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/user_profile.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.00, 0.00),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, -1.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 15, 0),
                                        child: Text(
                                          '김민종 님',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Readex Pro'),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 5, 5, 5),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(75, 20),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              backgroundColor: Colors.white,
                                              side: BorderSide(
                                                  color: Color(0xFFC2C2C2),
                                                  width: 1),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserProfilePage()),
                                              );
                                            },
                                            child: Text(
                                              "내 정보 수정",
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 11,
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(75, 20),
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              backgroundColor: Colors.white,
                                              side: BorderSide(
                                                  color: Color(0xFFC2C2C2),
                                                  width: 1),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserProfilePage()),
                                              );
                                            },
                                            child: Text(
                                              "로그아웃",
                                              style: TextStyle(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFFC2C2C2),
                                                fontSize: 11,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 15),
                                  child: Text('이메일 : donggubat@dgu.kr',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFC2C2C2),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 5),
                              child: Text(
                                '시설대관 현황',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyRentPageScreen()),
                                );
                                // Handle the action when "View All" button is pressed
                              },
                              child: Text(
                                '전체보기',
                                style: TextStyle(
                                  color:
                                      Colors.grey, // Set the color you desire
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: rent.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color statusColor = Colors.black; // Default color
                            String status = rent[index]['state'] ?? '';

                            if (status == '접수 완료') {
                              statusColor = Colors.green;
                            } else if (status == '이용 완료') {
                              statusColor = Colors.grey;
                            } else if (status == '신청 반려') {
                              statusColor = Colors.red;
                            } else if (status == '신청 취소') {
                              statusColor = Colors.black;
                            }

                            return ListTile(
                              title: Text(
                                '${rent[index]['place'] ?? ''}',
                                style: TextStyle(
                                    color: const Color.fromRGBO(
                                        0, 0, 0, 1)), // For place and time
                              ),
                              trailing: Text(
                                rent[index]['state'] ?? '',
                                style: TextStyle(color: statusColor),
                              ),
                              subtitle: Text(
                                '이용시간: ${rent[index]['time'] ?? ''} | 상태: ${rent[index]['state'] ?? ''}',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 1.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 15, 0, 5),
                              child: Text(
                                '프로그램 신청현황',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MyProgramPageScreen()),
                                );
                                // Handle the action when "View All" button is pressed
                              },
                              child: Text(
                                '전체보기',
                                style: TextStyle(
                                  color:
                                      Colors.grey, // Set the color you desire
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: program.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color statusColor = Colors.black; // Default color
                            String status = program[index]['state'] ?? '';

                            if (status == '접수 완료') {
                              statusColor = Colors.green;
                            } else if (status == '마감') {
                              statusColor = Colors.grey;
                            } else if (status == '신청 반려') {
                              statusColor = Colors.red;
                            } else if (status == '결과 확인') {
                              statusColor = Colors.blue;
                            }

                            return ListTile(
                              title: Text(
                                '${program[index]['name'] ?? ''}',
                                style: TextStyle(
                                    color: const Color.fromRGBO(
                                        0, 0, 0, 1)), // For place and time
                              ),
                              trailing: Text(
                                rent[index]['state'] ?? '',
                                style: TextStyle(color: statusColor),
                              ),
                            );
                          },
                        ),
                      ],
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
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.phone_android)),
                            Text('전화연결'),
                            SizedBox(height: 10),
                          ],
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
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.email_outlined)),
                            Text('E-mail'),
                            SizedBox(height: 10),
                          ],
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
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Icon(Icons.chat_bubble_outline)),
                            Text('카카오톡'),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
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

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보 수정'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // 사용자 아이콘 (여기에 사용자의 프로필 이미지 아이콘을 추가)
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      AssetImage('assets/user_profile.jpg'), // 프로필 이미지 경로
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // 사용자 이름
            Text(
              'hyundo',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 5.0),
            // 로그인한 이메일
            Text(
              'hyundo13@naver.com',
              style: TextStyle(fontSize: 16.0, color: Colors.grey),
            ),
            SizedBox(height: 30.0),
            // 전화번호 변경 버튼
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('전화번호 변경'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // 전화번호 변경 화면으로 이동
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PhoneNumberChangePage(); // 전화번호 변경 화면의 클래스
                }));
              },
            ),
            // 이메일 주소 변경 버튼
            ListTile(
              leading: Icon(Icons.email),
              title: Text('이메일 주소 변경'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // 이메일 주소 변경 화면으로 이동
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EmailChangePage(); // 이메일 주소 변경 화면의 클래스
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class ProfileImageChangePage extends StatefulWidget {
//   @override
//   _ProfileImageChangePageState createState() => _ProfileImageChangePageState();
// }

// class _ProfileImageChangePageState extends State<ProfileImageChangePage> {
//   // 프로필 이미지를 저장할 변수 또는 경로
//   String _profileImagePath = ''; // 초기 이미지 경로 설정

//   // 이미지 피커를 초기화
//   final ImagePicker _picker = ImagePicker();

//   // 이미지 업로드 함수
//   Future<void> _uploadImage() async {
//     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImagePath = pickedFile.path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('프로필 이미지 변경'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // 프로필 이미지 표시
//             CircleAvatar(
//               radius: 80,
//               backgroundImage: _profileImagePath.isEmpty
//                   ? AssetImage('assets/profile_image.png') // 기본 이미지 경로
//                   : FileImage(File(_profileImagePath)), // 업로드한 이미지 경로
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _uploadImage, // 이미지 업로드 함수 호출
//               child: Text('이미지 업로드'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
