import 'package:flutter/material.dart';
import 'main.dart';
import 'main_page.dart';

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
    return Scaffold(body: Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 170.0,
                ),
                Center(
                    child: Image(
                  image: AssetImage('assets/vertical_symnbol.jpg'),
                  width: 200.0,
                  height: 250.0,
                )),
                Form(
                    child: Theme(
                        data: ThemeData(
                            primaryColor: const Color.fromARGB(255, 44, 96, 68),
                            inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                                    color: Colors.teal, fontSize: 15.0))),
                        child: Container(
                          padding: EdgeInsets.all(70),
                          child: Column(children: <Widget>[
                            TextFormField(
                                // 아이디 입력칸
                                autofocus: true,
                                controller: controller1,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(15, 5, 5, 15),
                                    hintText: 'ID'),
                                keyboardType: TextInputType.emailAddress),
                            SizedBox(
                              // 아이디 입력칸과 비밀번호 입력창 공간 생성
                              height: 15.0,
                            ),
                            TextFormField(
                              // 비밀번호 입력칸
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 5, 15),
                                  hintText: 'Password'),
                              controller: controller2,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              // 비밀번호 입력칸과 로그인 버튼 공백
                              height: 40.0,
                            ),
                            ButtonTheme(
                                // 로그인 Button
                                minWidth: 100,
                                height: 10,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 44, 96, 68),
                                      fixedSize: Size(140, 10)),
                                  onPressed: () {
                                    if (controller1.text == 'hyundo' &&
                                        controller2.text == '1234') {
                                          
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
                                )),
                            ButtonBar(
                              // 버튼 바
                              alignment: MainAxisAlignment.center, // 중앙 정렬

                              buttonPadding:
                                  EdgeInsets.fromLTRB(0, 0, 0, 0), // 버튼의 패딩 주기
                              children: [
                                TextButton(
                                  // 텍스트버튼에 아이콘 넣기
                                  onPressed: () {
                                    print('회원가입 버튼');
                                  },
                                  child: Text('회원가입'),
                                  style: TextButton.styleFrom(
                                      primary: Colors.black54),
                                ),
                                TextButton(
                                  // 텍스트버튼에 아이콘 넣기
                                  onPressed: () {
                                    print('ID/PW 버튼');
                                  },
                                  child: Text('ID/PW 찾기'),
                                  style: TextButton.styleFrom(
                                      primary: Colors.black54),
                                ),
                              ],
                            )
                          ]),
                        ))),
              ],
            ),
          ),
        );
      },
    ));
  }
}
