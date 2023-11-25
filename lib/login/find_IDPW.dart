import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/widget_appbar.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FindIDPW extends StatefulWidget {
  @override
  State<FindIDPW> createState() => _FindIDPWState();
}

class _FindIDPWState extends State<FindIDPW> {
  final isSelected = <bool>[false, false];
  int selectedPageIndex = 0;

  List<Widget> pages = [
    Page1(), // 첫 번째 화면
    Page2(), // 두 번째 화면
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
            child: WidgetAppBar(title: "아이디/비밀번호 찾기"),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ToggleButtons(
                color: Colors.black.withOpacity(0.60),
                selectedColor: Color.fromARGB(255, 44, 96, 68),
                selectedBorderColor: Color.fromARGB(255, 44, 96, 68),
                fillColor: Color.fromARGB(255, 44, 96, 68).withOpacity(0.08),
                splashColor: Color.fromARGB(255, 44, 96, 68).withOpacity(0.12),
                hoverColor: Color.fromARGB(255, 44, 96, 68).withOpacity(0.04),
                // borderRadius: BorderRadius.circular(4.0),

                constraints: BoxConstraints(minHeight: 40.0),
                isSelected: [selectedPageIndex == 0, selectedPageIndex == 1],
                onPressed: (int newIndex) {
                  setState(() {
                    // 토글 버튼 상태 업데이트
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == newIndex) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                    selectedPageIndex = newIndex;
                  });
                },
                children: <Widget>[
                  Container(
                    width: (MediaQuery.of(context).size.width - 3) /
                        2, // 화면 가로 크기의 절반
                    child: Center(
                      child: Text(
                        '아이디 찾기',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width - 3) /
                        2, // 화면 가로 크기의 절반
                    child: Center(
                      child: Text(
                        '비밀번호 찾기',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: pages[selectedPageIndex],
              ),
            ],
          )),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _authenticationController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isPhoneNumber = false;
  int phoneCount = 0;
  bool isCheck = true;
  String _verificationId = '';

  //hys 1125 추가, sms 메시지 보내는 코드
  // void _SendMessage() {
  //     // String Pnum = '+82'+ _phoneController.text.substring(1);

  //     // FirebaseAuth.instance.verifyPhoneNumber(phoneNumber : Pnum,
  //     //         verificationCompleted: (PhoneAuthCredential credential) async {
  //     //           print('인증 문자 수신');
  //     //         },
  //     //         verificationFailed: (FirebaseAuthException e) {
  //     //           print('인증 문자 전송 실패');
  //     //         },
  //     //         codeSent: (String verificationId, int? resendToken) async {
  //     //           print('인증 문자 전송');
  //     //           this._verificationId = verificationId; // 인증 코드 확인때 필요한 값
  //     //         },
  //     //         codeAutoRetrievalTimeout: (String verificationId){});
  //     print("hello");
  // }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      // 전화번호 입력칸
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
                        hintText: "전화번호를 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 44, 96, 68),
                      minimumSize: Size(100, 40),
                    ),
                    onPressed: () {
                      // 여기에서 중복을 확인하고 상태를 업데이트합니다.
                      setState(() {
                        isPhoneNumber = !isPhoneNumber;
                        print('전화번호 버튼');
                        print(isPhoneNumber);
                        
                      });
                      // _SendMessage();

                    },
                    child: Text('인증번호 받기'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  // 인증번호 입력칸
                  controller: _authenticationController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isCheck
                            ? Color.fromARGB(100, 0, 0, 0)
                            : Colors.red.shade400,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isCheck
                            ? Color.fromARGB(100, 0, 0, 0)
                            : Colors.red.shade400,
                        width: 1,
                      ),
                    ),
                    hintText: "인증번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 44, 96, 68),
                    minimumSize: Size(70, 40),
                  ),
                  onPressed: () {
                    setState(() {
                      isCheck = _authenticationController.text == "1234";
                      print('인증번호');
                        print(isCheck);
                    });
                  },
                  child: Text('확인'),
                ),
              ),
            ],
          ),
        ),
          if (!isCheck)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  '인증번호가 틀렸습니다.',
                  style: TextStyle(
                    color: Colors.red.shade400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
        Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Container(
            padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
            decoration: BoxDecoration(
              color: Color(0x30C2C2C2),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    '가입하신 아이디는',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(" "),
                Center(
                  child: Text(
                    "입니다.",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _authenticationController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  bool _passwordsMatch = true;
  bool isPassword = false;
  int passwordCount = 0;
  bool isPhoneNumber = false;
  bool isCheck = true;

  int phoneCount = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
              child: TextFormField(
                  // 아이디 입력칸
                  controller: _idController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 5, 15),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(100, 0, 0, 0),
                        width: 1,
                      ),
                    ),
                    hintText: "아이디를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 17, color: Colors.black54),
                  ),
                  keyboardType: TextInputType.text),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        // 전화번호 입력칸
                        controller: _phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(100, 0, 0, 0),
                              width: 1,
                            ),
                            //borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: "전화번호를 입력해주세요.",
                          hintStyle:
                              TextStyle(fontSize: 17, color: Colors.black54),
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 96, 68),
                        minimumSize: Size(100, 40),
                      ),
                      onPressed: () {
                        // 여기에서 중복을 확인하고 상태를 업데이트합니다.
                        setState(() {
                          isPhoneNumber = !isPhoneNumber;
                          print('전화번호 버튼');
                          print(isPhoneNumber);
                        });
                      },
                      child: Text('인증번호 받기'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isPhoneNumber)
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      // 인증번호 입력칸
                      controller: _authenticationController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isCheck
                                ? Color.fromARGB(100, 0, 0, 0)
                                : Colors.red.shade400,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isCheck
                                ? Color.fromARGB(100, 0, 0, 0)
                                : Colors.red.shade400,
                            width: 1,
                          ),
                        ),
                        hintText: "인증번호를 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 96, 68),
                        minimumSize: Size(70, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          isCheck = _authenticationController.text == "1234";
                          print('인증번호');
                          print(isCheck);
                          phoneCount++;
                        });
                      },
                      child: Text('확인'),
                    ),
                  ),
                ],
              ),
            ),
          if (phoneCount != 0)
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: AlignmentDirectional(-1.00, 0.00),
                child: Text(
                  isCheck ? '인증되었습니다.' : '인증 번호가 틀립니다.',
                  style: TextStyle(
                    color: isCheck ? Colors.green : Colors.red.shade400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
                  child: TextFormField(
                    // 비밀번호 입력칸
                    controller: _passwordController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0),
                            width: 1,
                          ),
                          //borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "비밀번호를 입력해주세요.",
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.black54)),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 70),
                  child: TextFormField(
                    // 비밀번호 재입력칸
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
                      hintStyle: TextStyle(fontSize: 17, color: Colors.black54),
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              if (isPassword) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('비밀번호가 변경되었습니다.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
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
                      builder: (context) => LogIn(),
                    ),
                    (route) => false,
                  );
                });
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('비밀번호를 변경해주세요.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text(
              '비밀번호 변경하기',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 44, 96, 68),
              fixedSize: Size(200, 50),
            ),
          ),
        ],
      ),
    );
  }
}
