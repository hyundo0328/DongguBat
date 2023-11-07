// mypage.dart
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import 'email_change.dart';
import 'phone_change.dart';

class MyPageScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
        body: SafeArea(
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 5, 15),
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
              ],
            ),
          ),
        ),
        bottomNavigationBar: WidgetBottomNavigationBar(),
      ),
    );
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
