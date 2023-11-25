import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'my_page.dart';
import './camera.dart';

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final TextEditingController _nameController =
      TextEditingController(text: '김동구');
  final TextEditingController _phoneController =
      TextEditingController(text: '010-1234-5678');
  final TextEditingController _idController =
      TextEditingController(text: 'donggubat');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _emailController =
      TextEditingController(text: 'donggubat@dongguk.edu.kr');
  final TextEditingController _addressController =
      TextEditingController(text: '서울특별시 성동구 마장로39길 31');

  bool isDuplicate = false;
  int duplicateCount = 0;
  bool isPassword = false;
  int passwordCount = 0;
  bool isPhoneNumber = false;
  int phoneCount = 0;
  bool isCheck = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "내 정보 수정"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage('assets/user_profile.jpg'),
                        ),
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CameraScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Color.fromARGB(255, 16, 16, 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  // 이름 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '이름',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  // 이름 필드
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.1), // Adjust the opacity as needed
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      controller: _nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        hintText: "입력한 비밀번호를 다시 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Align(
                  // 전화번호 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: Text(
                      '전화번호',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  // 전화번호 필드
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.1), // Adjust the opacity as needed
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Align(
                  // 아이디 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: Text(
                      '아이디',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  // 아이디 필드
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.1), // Adjust the opacity as needed
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      controller: _idController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Align(
                  // 비밀번호 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: Text(
                      '비밀번호',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  // 새로운 비밀번호 입력 필드
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        hintText: "비밀번호를 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                ),
                Center(
                  // 비밀번호 확인 필드
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _rePasswordController,
                      onChanged: (value) {
                        setState(() {
                          isPassword = _rePasswordController.text ==
                              _passwordController.text;
                          passwordCount++;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isPassword
                                ? Color.fromARGB(100, 0, 0, 0)
                                : Colors.red.shade400,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isPassword
                                ? Color.fromARGB(100, 0, 0, 0)
                                : Colors.red.shade400,
                            width: 1,
                          ),
                        ),
                        hintText: "입력한 비밀번호를 다시 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 15, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                ),
                if (passwordCount != 0)
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Text(
                      isPassword ? '비밀번호가 일치합니다.' : '비밀번호가 일치하지 않습니다.',
                      style: TextStyle(
                        color: isPassword ? Colors.green : Colors.red.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ),
                Align(
                  // 이메일 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: Text(
                      '이메일',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Align(
                  // 주소 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '주소',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                  // 주소 필드
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.1), // Adjust the opacity as needed
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      controller: _addressController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('개인 정보가 변경되었습니다.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('확인'),
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        // After the dialog is closed, navigate to the new page
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPageScreen(),
                          ),
                          (route) => false,
                        );
                      });
                    },
                    child: Text(
                      '변경하기',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 44, 96, 68),
                      fixedSize: Size(170, 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
