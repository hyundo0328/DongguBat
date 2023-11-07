import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../login/signup.dart';
import '../login/find_IDPW.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInstate createState() => _LogInstate();
}

class _LogInstate extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // 더 이상 사용하지 않으면 메모리 낭비 방지를 위해서 dispose method를 사용 (추가)

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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MainPage()));
                        } else if (controller1.text == 'hyundo' &&
                            controller2.text != '1234') {
                        } else if (controller2.text != 'hyundo' &&
                            controller2.text != '1234') {
                        } else {}
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
