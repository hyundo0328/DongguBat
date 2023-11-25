import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import 'my_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// TextFormField 설명 텍스트 생성 Class
class AlignTextClass extends StatelessWidget {
  final String textname;

  AlignTextClass({required this.textname});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.00, 0.00),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
        child: Text(
          this.textname,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

// TextFormField 생성 Class
class TextFieldClass extends StatelessWidget {
  final String textName;
  final TextEditingController controller;

  TextFieldClass({required this.textName, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: this.textName == '이름' ||
                this.textName == '전화번호' ||
                this.textName == '아이디'
            ? BoxDecoration(
                color: Colors.black
                    .withOpacity(0.1), // Adjust the opacity as needed
                borderRadius: BorderRadius.circular(8.0),
              )
            : null,
        child: TextFormField(
          readOnly:
              this.textName == '비밀번호' || this.textName == '이메일' ? false : true,
          controller: this.controller,
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
            hintText: this.textName == '비밀번호'
                ? "비밀번호를 입력해주세요."
                : (this.textName == '비밀번호 확인' ? "입력한 비밀번호를 다시 입력해주세요." : null),
            hintStyle: (this.textName == '비밀번호' || this.textName == '비밀번호 확인')
                ? TextStyle(fontSize: 13, color: Colors.black54)
                : null,
          ),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  String? current_uid = FirebaseAuth.instance.currentUser?.uid;
  String? current_email = FirebaseAuth.instance.currentUser?.email;
  String? current_name = FirebaseAuth.instance.currentUser?.displayName;
  String? current_photo = FirebaseAuth.instance.currentUser?.photoURL;

  // 이름 정보 가져오기
  final TextEditingController _nameController =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.displayName);

  // 전화번호 정보 가져오기
  final TextEditingController _phoneController =
      TextEditingController(text: '');

  // 아이디 정보 가져오기
  final TextEditingController _idController =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.email);

  // 비밀번호 정보 저장하기
  final TextEditingController _passwordController =
      TextEditingController();

  // 비밀번호 확인
  final TextEditingController _rePasswordController = TextEditingController();

  // 이메일 정보 가져오기
  final TextEditingController _emailController =
      TextEditingController(text: FirebaseAuth.instance.currentUser?.email);

  // 주소 정보 가져오기
  final TextEditingController _addressController =
      TextEditingController(text: ""); 


  bool isDuplicate = false;
  int duplicateCount = 0;
  bool isPassword = false;
  int passwordCount = 0;
  bool isPhoneNumber = false;
  int phoneCount = 0;
  bool isCheck = true;

  //hys 1125 추가 - 사용자 주소, 전화번호 받아오는 함수  
  void set_address() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    // 문서가 존재하는지 확인
    if (documentSnapshot.exists) {
      // 문서의 데이터 가져오기
      Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

      _addressController.text = data['address'];
      _phoneController.text = data['Pnum'];

    }
    else{
      _addressController.text = "error!";
    }
  }
  

  @override
  void initState() {
    set_address();
    super.initState();
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
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage(current_photo.toString()), // 프로필 이미지 경로
                    ),
                  ),
                ),

                // 이름 칸
                AlignTextClass(textname: '이름'),
                TextFieldClass(textName: '이름', controller: _nameController),

                // 아이디 칸
                AlignTextClass(textname: '아이디'),
                TextFieldClass(textName: '아이디', controller: _idController),

                // 전화번호 칸
                AlignTextClass(textname: '전화번호'),
                TextFieldClass(textName: '전화번호', controller: _phoneController),

                // 비밀번호 칸
                AlignTextClass(textname: '비밀번호'),
                TextFieldClass(
                    textName: '비밀번호', controller: _passwordController),
                Center(
                  // 비밀번호 확인 필드
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                            TextStyle(fontSize: 13, color: Colors.black54),
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
                
                // 이메일 칸
                AlignTextClass(textname: '이메일'),
                TextFieldClass(textName: '이메일', controller: _emailController),

                // 주소 칸
                AlignTextClass(textname: '주소'),
                TextFieldClass(textName: '주소', controller: _addressController),
                

                // 변경하기 버튼
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
