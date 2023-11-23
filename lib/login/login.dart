import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../login/signup.dart';
import '../login/find_IDPW.dart';
import 'recommand.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class LogIn extends StatefulWidget {
  @override
  _LogInstate createState() => _LogInstate();
}

class _LogInstate extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
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
                        // autofocus: true,
                        controller: controller1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                            hintText: 'ID'),
                        keyboardType: TextInputType.text),
                  )),
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
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 96, 68),
                      ),
                      onPressed: () {
                        if (controller1.text == '' && controller2.text == '') {
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
                      child: Text('Login'),
                    ),
                  ),
                  Center(
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
                          child: Text('회원가입'),
                          style: TextButton.styleFrom(primary: Colors.black45),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FindIDPW()),
                            );
                          },
                          child: Text('ID/PW 찾기'),
                          style: TextButton.styleFrom(primary: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
