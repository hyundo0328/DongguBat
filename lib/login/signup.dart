import 'package:flutter/material.dart';
import 'recommand.dart';
import '../widgets/widget_appbar.dart';
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

  TextFieldClass({
    required this.textName,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: this.controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 5, 15),
          border: OutlineInputBorder(
            // TextField가 비밀번호 확인나 인증번호이면 Border 색상 변경이 되도록 하고 아니면 색상 유지
            borderSide: BorderSide(
              color: this.textName == '아이디'
                  ? (isPassword // 비밀번호 확인 경우
                      ? Colors.red.shade400
                      : Color.fromARGB(100, 0, 0, 0))
                  : this.textName == '인증번호'
                      ? (isCheck // 인증번호 확인 경우
                          ? Color.fromARGB(100, 0, 0, 0)
                          : Colors.red.shade400)
                      : Color.fromARGB(100, 0, 0, 0), // 일반적인 경우
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            // TextField가 비밀번호 확인이나 인증번호이면 Border 색상 변경이 되도록 하고 아니면 색상 유지
            borderSide: BorderSide(
              color: this.textName == '아이디'
                  ? (isPassword // 비밀번호 확인 경우
                      ? Colors.red.shade400
                      : Color.fromARGB(100, 0, 0, 0))
                  : this.textName == '인증번호'
                      ? (isCheck // 인증번호 확인 경우
                          ? Color.fromARGB(100, 0, 0, 0)
                          : Colors.red.shade400)
                      : Color.fromARGB(100, 0, 0, 0), // 일반적인 경우
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
        obscureText: this.textName == '비밀번호' ? true : false,
      ),
    );
  }
}

bool isDuplicate = false;
int duplicateCount = 0;
bool isPassword = false;
int passwordCount = 0;
bool isPhoneNumber = false;
int phoneCount = 0;
bool isCheck = true;

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
  bool agreedToTerms = false;

  String _verificationId = '';  //sms 인증할 때 필요한 거 
  String _uid = ''; //사용자 uid 저장할때 

  void checkSignUp() {
    final List<dynamic> check = [
      _nameController.text,
      _idController.text,
      _passwordController.text,
      _phoneController.text,
      _emailController.text,
      _addressController.text,
      agreedToTerms
    ];

    final List<String> nothing = [
      "이름",
      "아이디",
      "비밀번호",
      "전화번호",
      "이메일",
      "주소",
      "개인정보 확인"
    ];

    for (int i = 0; i < 7; i++) {
      if ((i <= 5 && check[i] == '') || (i == 6 && check[i] == false)) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(nothing[i] + '을/를 확인하십시오.'),
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

    flag = true;
  }

  //hys 1125 추가, sms 메시지 보내는 코드
  void _SendMessage() {
      String Pnum = '+82'+ _phoneController.text.substring(1);

      FirebaseAuth.instance.verifyPhoneNumber(phoneNumber : Pnum,
              verificationCompleted: (PhoneAuthCredential credential) async {
                print('인증 문자 수신');
              },
              verificationFailed: (FirebaseAuthException e) {
                print('인증 문자 전송 실패');
              },
              codeSent: (String verificationId, int? resendToken) async {
                print('인증 문자 전송');
                this._verificationId = verificationId; // 인증 코드 확인때 필요한 값
              },
              codeAutoRetrievalTimeout: (String verificationId){});
  }

  //hys 1125 추가, 인증 이메일 전송하는 코드
  void _sendEmail() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    print("email sent");
  }

  //hys 1125 추가, 휴대폰 인증 진행하는 코드 -> 인증되면 1 돌려줌. 
  Future<bool> _CheckVerify() async {
    PhoneAuthCredential phoneAuthCredential =  
    PhoneAuthProvider.credential(
      verificationId: this._verificationId, smsCode: _authenticationController.text);
    
    try {
        // FirebaseAuth 인스턴스를 얻어와서 signInWithCredential 메서드를 사용하여 인증을 시도합니다.
        final UserCredential authCredential = await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

        // 인증에 성공한 경우, UserCredential에서 User를 얻어와서 사용할 수 있습니다.
        final User? user = authCredential.user;

        if (user != null) {
          // 인증된 사용자에 대한 추가 로직을 수행합니다.
          print('인증 성공: ${user.uid}');
          return true;
          
        } else {
          // 인증된 사용자가 null인 경우에 대한 처리
          print('인증된 사용자가 없습니다.');
        }
      } catch (e) {
        // 인증에 실패한 경우, 예외를 처리합니다.
        print('인증 실패: $e');
      }
      return false;
    }

  //hys 1125 추가, 회원가입시 DB에 사용자 정보 저장
  Future<bool> _singupInDB() async{
    //login 실행
    try {
      // final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      //   email: _emailController.text, 
      //   password: _passwordController.text
      // );
      print("sign in with : ");
      print(FirebaseAuth.instance.currentUser?.uid);
      //auth에서 비밀번호와 이메일 업데이트
      await FirebaseAuth.instance.currentUser?.updateEmail(_emailController.text);
      await FirebaseAuth.instance.currentUser?.updateDisplayName(_nameController.text);
      await FirebaseAuth.instance.currentUser?.updatePassword(_passwordController.text);
      await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).set({
        "id":_idController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "Pnum": _phoneController.text,
        "address": _addressController.text,
        "name": _nameController.text,
        // 다른 사용자 속성들도 필요에 따라 추가할 수 있습니다.
      });
      print("db update!");

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return false;
      } 
    }
    return false;
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
          child: WidgetAppBar(title: "회원가입"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // 이름 칸
                  AlignTextClass(textname: '이름'),
                  TextFieldClass(
                    textName: '이름',
                    controller: _nameController,
                  ),

                  // 아이디 칸
                  AlignTextClass(textname: '아이디'),
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          // 아이디 입력칸
                          child: TextFieldClass(
                            textName: '아이디',
                            controller: _idController,
                          ),
                        ),
                        // 확인 버튼
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

                  // 비밀번호 칸
                  AlignTextClass(textname: '비밀번호'),
                  TextFieldClass(
                    textName: '비밀번호',
                    controller: _passwordController,
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: TextFormField(
                        // 비밀번호 재입력칸
                        controller: _rePasswordController,
                        onChanged: (value) {
                          setState(() {
                            isPassword = _rePasswordController.text ==
                                _passwordController.text;
                            passwordCount++;
                          },
                        );
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

                  // 전화번호 칸
                  AlignTextClass(textname: '전화번호'),
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        children: [
                          // 전화번호 필드
                          Expanded(
                            child: TextFieldClass(
                              textName: '전화번호',
                              controller: _phoneController,
                            ),
                          ),
                          
                          // 인증번호 받기 버튼
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
                                  _SendMessage();  //sms 인증번호 전송 
                                });
                              },
                              child: Text('인증번호 받기'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // 인증번호 받기 버튼 누르면 인증번호 입력칸 출력
                  if (isPhoneNumber)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextFieldClass(
                            textName: '인증번호',
                            controller: _authenticationController,
                          )
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
                                  isCheck = _CheckVerify() as bool;
                                  //    _authenticationController.text == "1234";
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
                  // 인증번호 확인
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

                  // 이메일 칸
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AlignTextClass(textname: '이메일'),
                      TextFieldClass(
                        textName: '이메일',
                        controller: _emailController,
                      ),
                      SizedBox(height: 16), // 버튼 위에 간격 추가

                      // 여기에 버튼 추가
                      ElevatedButton(
                        onPressed: () {
                          if (passwordCount != 0){
                            _sendEmail();
                          }
                          else{
                            Align(
                              alignment: AlignmentDirectional(-1.00, 0.00),
                              child: Text(
                                '비밀번호가 일치하지 않습니다.',
                                style: TextStyle(
                                  color:
                                      Colors.red.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }
                          
                          // 버튼이 눌렸을 때 수행할 동작 정의
                          // 예: 이메일을 확인하고 어떤 작업 수행
                        },
                        child: Text('이메일 인증하기'), // 버튼에 표시될 텍스트
                      ),
                    ],
                  ),
                  // AlignTextClass(textname: '이메일'),
                  // TextFieldClass(
                  //   textName: '이메일',
                  //   controller: _emailController,
                  // ),

                  // 주소 칸
                  AlignTextClass(textname: '주소'),
                  TextFieldClass(
                    textName: '주소',
                    controller: _addressController,
                  ),

                  // 개인 정보 방침
                  AlignTextClass(textname: '개인 정보 방침'),
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

                  // 동의 버튼
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

                  // 가입하기 버튼
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: () {
                        // _sendEmail();  //이메일 가입하기 위해 일단 실행 

                        if (!flag) {
                          checkSignUp();
                        } else {
                          bool emailverify = _singupInDB() as bool;
                        if (!emailverify){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('오류'),
                                  content: Text('이메일 인증을 먼저 진행해주세요!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // 경고 창 닫기
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('확인'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecommandPage(),
                            ),
                            (route) => false,
                          );
                        }
                        //DB에 데이터 넣기
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