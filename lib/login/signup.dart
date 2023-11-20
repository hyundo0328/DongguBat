import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreedToTerms = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _RepasswordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _PnumController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = true;

  void _handleSignUp() {
    String id = _idController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String Pnum = _PnumController.text;
    String address = _addressController.text;
    String name = _nameController.text;
    String confirmPassword = _confirmPasswordController.text;
    if (!agreedToTerms) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('동의 필요'),
            content: Text('개인정보 수집 및 이용에 동의해야 합니다.'),
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

    if (password != confirmPassword) {
      setState(() {
        _passwordsMatch = false;
      });
    } else {
      // 여기서 회원가입 로직을 구현할 수 있습니다.
      // 서버에 데이터를 전송하고 회원 정보를 저장하는 코드를 추가해야 합니다.

      // 예: 서버로 회원가입 요청을 보내는 부분
      // signUp(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 96, 68),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      // autofocus: true,
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
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(100, 255, 89, 99),
                            width: 1,
                          ),
                          // borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.text),
                )),
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
                    child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextFormField(
                      // 아이디 입력칸
                      // autofocus: true,
                      controller: _idController,
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
                )),
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
                      // autofocus: true,
                      controller: _passwordController,
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
                          hintText: "비밀번호를 입력해주세요.",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      keyboardType: TextInputType.text),
                )),
                Center(
                    child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                  child: TextFormField(
                      // 비밀번호 재입력칸
                      // autofocus: true,
                      controller: _RepasswordController,
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
                          hintText: "입력한 비밀번호를 다시 입력해주세요.",
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      keyboardType: TextInputType.text),
                )),
                Align(
                  // 이메일 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '이메일',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Center(
                    child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: TextFormField(
                      // 이메일 입력칸
                      // autofocus: true,
                      controller: _emailController,
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
                )),
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
                      // autofocus: true,
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
                )),
                if (!_passwordsMatch)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AlertDialog(
                      title: Text('오류'),
                      content: Text('비밀번호가 일치하지 않습니다.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('확인'),
                        ),
                      ],
                    ),
                  ),
                Align(
                  // 아이디 텍스트
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
                      Text('(2) 소셜 계정을 통해 회원가입 시 아래와 같은 정보들이 추가로 수집될 수 있습니다.'),
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
                ElevatedButton(
                  onPressed: _handleSignUp,
                  child: Text('가입 하기'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 44, 96, 68),
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
