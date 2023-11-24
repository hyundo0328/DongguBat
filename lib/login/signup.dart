import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import 'recommand.dart';
import '../widgets/widget_appbar.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool flag = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _authenticationController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool agreedToTerms = false;

  void _handleSignUp() {
    final List<String> check = [
      _nameController.text,
      _idController.text,
      _passwordController.text,
      _phoneController.text,
      _emailController.text,
      _addressController.text
    ];

    final List<String> nothing = ["이름", "아이디", "비밀번호", "전화번호", "이메일", "주소"];

    for (int i = 0; i < 6; i++) {
      if (check[i] == '') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(nothing[i] + '을/를 입력하십시오.'),
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
        return;
      }
    }
    if (!agreedToTerms) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('개인정보 수집을 동의하십시오.'),
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
      return;
    }

    flag = true;
  }

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
          child: WidgetAppBar(title: "회원가입"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: TextFormField(
                          // 이름 입력칸
                          controller: _nameController,
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
                          ),
                          keyboardType: TextInputType.text),
                    ),
                  ),
                  Align(
                    // 아이디 텍스트
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
                      child: Text(
                        '아이디',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // 아이디 입력칸
                            controller: _idController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: isDuplicate
                                      ? Colors.red.shade400
                                      : Color.fromARGB(100, 0, 0, 0),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: isDuplicate
                                      ? Colors.red.shade400
                                      : Color.fromARGB(100, 0, 0, 0),
                                  width: 1,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 44, 96, 68),
                              minimumSize: Size(70, 40),
                            ),
                            onPressed: () {
                              setState(() {
                                isDuplicate = _idController.text == "test";
                                print('아이디 입력칸');
                                print(isDuplicate);
                                duplicateCount++;
                              });
                            },
                            child: Text('확인'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (duplicateCount != 0)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        isDuplicate ? '중복된 아이디입니다.' : '사용 가능한 아이디입니다.',
                        style: TextStyle(
                          color: isDuplicate ? Colors.red : Colors.green,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Align(
                    // 비밀번호 텍스트
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
                      child: Text(
                        '비밀번호',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                                TextStyle(fontSize: 12, color: Colors.black54)),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.black54),
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
                          color:
                              isPassword ? Colors.green : Colors.red.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Align(
                      // 전화번호 텍스트
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                        child: Text(
                          '전화번호',
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                                // 전화번호 입력칸
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 5, 5, 15),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromARGB(100, 0, 0, 0),
                                      width: 1,
                                    ),
                                    //borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                keyboardType: TextInputType.text),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 44, 96, 68),
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              // 인증번호 입력칸
                              controller: _authenticationController,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 5, 5, 15),
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
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 44, 96, 68),
                                minimumSize: Size(70, 40),
                              ),
                              onPressed: () {
                                setState(() {
                                  isCheck =
                                      _authenticationController.text == "1234";
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
                    Align(
                      alignment: AlignmentDirectional(-1.00, 0.00),
                      child: Text(
                        isCheck ? '인증되었습니다.' : '인증 번호가 틀립니다.',
                        style: TextStyle(
                          color: isCheck ? Colors.green : Colors.red.shade400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  Align(
                    // 이메일 텍스트
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
                      child: Text(
                        '이메일',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Center(
                    child: TextFormField(
                      // 이메일 입력칸
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 255, 89, 99),
                            width: 1,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Align(
                    // 주소 텍스트
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
                      child: Text(
                        '주소',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                      child: TextFormField(
                          // 주소 입력칸
                          controller: _addressController,
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
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(100, 255, 89, 99),
                                width: 1,
                              ),
                              // borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          keyboardType: TextInputType.text),
                    ),
                  ),
                  Align(
                    // 개인 정보 방침 텍스트
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 3),
                      child: Text(
                        '개인 정보 방침',
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. 수집하는 개인정보'),
                        Text(
                            '(1) 회사는 최초 회원 가입시 원활한 고객상담, 서비스 제공을 위해 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.'),
                        Text('필수항목 : 이메일 주소, 이름(닉네임), 비밀번호'),
                        Text(
                            '선택항목 : 프로필 사진, 회사/단체 이름, 회사/단체 규모, 산업군, 부서, 유형(개인/기업/단체), 지역, 전화번호 등'),
                        Text(
                            '(2) 소셜 계정을 통해 회원가입 시 아래와 같은 정보들이 추가로 수집될 수 있습니다.'),
                        Text('네이버 : 프로필 사진, 나이'),
                        Text('페이스북 : 프로필 사진'),
                        Text('구글 : 프로필 사진'),
                        Text(
                            '(3) 서비스 이용 과정이나 사업처리 과정에서 아래와 같은 정보들이 추가로 수집될 수 있습니다.'),
                        Text(
                            '거래정보 : 개인의 경우 생년월일(정기결제에 한함), 신용카드정보(신용카드번호, 유효기간, 비밀번호 앞 두 자리), 세금계산서 발행을 위한 회계 담당자 정보(이름, 연락처, 이메일주소) 등'),
                        Text(
                            '서비스 이용 정보 : 서명 요청자 및 참여자 정보 (이름, 이메일 주소, 전화번호), 전화번호, IP 주소, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 브라우저 정보, 운영체제 정보(OS), 사용 기기 정보, MAC 주소, 방문 일시 등'),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: agreedToTerms,
                        activeColor: const Color.fromARGB(255, 44, 96, 68),
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              agreedToTerms = value;
                            });
                          }
                        },
                      ),
                      Text('개인정보 수집 및 이용에 동의합니다.'),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        if (!flag) {
                          _handleSignUp();
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecommandPage(),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      child: Text(
                        '가입 하기',
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
      ),
    );
  }
}
