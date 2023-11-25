import 'package:donggu_bat/login/signup.dart';
import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import 'signup_before.dart';
import '../login/find_IDPW.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInstate createState() => _LogInstate();
}

class _LogInstate extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  //hys 1125 추가, 이메일 로그인 구현 
  Future<bool> _LoginWithEmail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      print("sign in with : ");
      print(FirebaseAuth.instance.currentUser?.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }


  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // 사용자가 다이얼로그 외부를 탭하면 닫히지 않도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('아이디 또는 비밀번호가 틀렸습니다.'),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(23, 30, 23, 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                      child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                    child: Image(
                      image: AssetImage('assets/vertical_symnbol.jpg'),
                      width: 200.0,
                      height: 250.0,
                    ),
                  )),
                  Center(
                      child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 70, 50, 15),
                    child: TextFormField(
                        // 아이디 입력칸
                        controller: controller1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                            hintText: 'ID'),
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(50, 0, 50, 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                          hintText: 'Password',
                        ),
                        controller: controller2,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 44, 96, 68),
                          fixedSize: Size(150, 45),
                        ),
                        onPressed: () async {
                          // _LoginWithEmail(controller1.text, controller2.text);
                          // if (controller1.text == '' &&
                          //     controller2.text == '') {
                          if (await _LoginWithEmail(controller1.text, controller2.text)) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                              (route) => false,
                            );
                          } else {
                            _showConfirmationDialog(context);
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 247, 230, 0),
                          fixedSize: Size(150, 45), // 원하는 가로 길이와 세로 길이를 지정
                        ),
                        onPressed: () {
                          print("카톡 로그인 버튼 클릭");
                        },
                        child: Text(
                          '카카오 로그인',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center, // 중앙 정렬
                        buttonPadding:
                            EdgeInsets.fromLTRB(0, 0, 0, 0), // 버튼의 패딩 주기
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            style:
                                TextButton.styleFrom(primary: Colors.black45),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FindIDPW()),
                              );
                            },
                            child: Text(
                              'ID/PW 찾기',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            style:
                                TextButton.styleFrom(primary: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
