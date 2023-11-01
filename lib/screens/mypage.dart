// mypage.dart
import 'package:flutter/material.dart';
import 'communicate.dart';
import '../main.dart';
import 'program_rent.dart';
import 'main_page.dart';

class MyPageScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('마이페이지'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 44, 96, 68),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/user_profile.jpg'),
                    ),
                    SizedBox(height: 10.0),
                    // 사용자 이름
                    Text(
                      'hyundo',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 5.0),
                    // 로그인한 이메일
                    Text(
                      'hyundo13@naver.com',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                    SizedBox(height: 10.0),
                    // 로그아웃 버튼
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfilePage()),
                        );
                      },
                      child: Text('내 정보 변경'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 44, 96, 68),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
          currentIndex: 2,
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

class PhoneNumberChangePage extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();

  void _handleChangePhoneNumber() {
    // 여기에 전화번호 변경 로직을 구현하세요.
    String newPhoneNumber = _phoneNumberController.text;
    // 변경된 전화번호를 서버에 업데이트하거나 로컬 저장소에 저장하는 등의 작업을 수행하세요.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('전화번호 변경'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: '새로운 전화번호'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleChangePhoneNumber,
              child: Text('전화번호 변경'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 44, 96, 68),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailChangePage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  void _handleChangeEmail() {
    // 여기에 이메일 주소 변경 로직을 구현하세요.
    String newEmail = _emailController.text;
    // 변경된 이메일 주소를 서버에 업데이트하거나 로컬 저장소에 저장하는 등의 작업을 수행하세요.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이메일 주소 변경'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '새로운 이메일 주소'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleChangeEmail,
              child: Text('이메일 주소 변경'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 44, 96, 68),
              ),
            ),
          ],
        ),
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
      body: ListView(
        children: [
          // 상단 정보 컨테이너
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 사용자 아이콘 (여기에 사용자의 프로필 이미지 아이콘을 추가)
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      AssetImage('assets/user_profile.jpg'), // 프로필 이미지 경로
                ),
                SizedBox(height: 10.0),
                // 사용자 이름
                Text(
                  'hyundo',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 5.0),
                // 로그인한 이메일
                Text(
                  'hyundo13@naver.com',
                  style: TextStyle(fontSize: 16.0, color: Colors.grey),
                ),
                SizedBox(height: 10.0),
                // 로그아웃 버튼
                ElevatedButton(
                  onPressed: () {
                    // 로그아웃 로직 추가
                  },
                  child: Text('로그아웃'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 44, 96, 68),
                  ),
                ),
              ],
            ),
          ),

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