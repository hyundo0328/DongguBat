import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/widget_appbar.dart';

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
        body: Align(
          child: Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ToggleButtons(
                  color: Colors.black.withOpacity(0.60),
                  selectedColor: Color.fromARGB(255, 44, 96, 68),
                  selectedBorderColor: Color.fromARGB(255, 44, 96, 68),
                  fillColor: Color.fromARGB(255, 44, 96, 68).withOpacity(0.08),
                  splashColor:
                      Color.fromARGB(255, 44, 96, 68).withOpacity(0.12),
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
                      width:
                          MediaQuery.of(context).size.width / 2, // 화면 가로 크기의 절반
                      child: Center(child: Text('아이디 찾기')),
                    ),
                    Container(
                      width:
                          MediaQuery.of(context).size.width / 2, // 화면 가로 크기의 절반
                      child: Center(child: Text('비밀번호 찾기')),
                    ),
                  ],
                ),
                Expanded(
                  child: pages[selectedPageIndex],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final TextEditingController _authentication = TextEditingController();
  final TextEditingController _PnumController = TextEditingController();
  bool _passwordsMatch = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 10),
            child: TextFormField(
                // 아이디 입력칸
                // autofocus: true,
                controller: _PnumController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 5, 15),
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
                    hintText: "전화번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 20, 30, 10),
            child: TextFormField(
                // 인증번호 입력칸
                // autofocus: true,
                controller: _authentication,
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
                    hintText: "발송된 인증번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
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
                  child: Text('가입하신 아이디는'),
                ),
                Text(" "),
                Center(
                  child: Text("입니다."),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _PnumController = TextEditingController();
  final TextEditingController _authentication = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordsMatch = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 10),
            child: TextFormField(
                // 아이디 입력칸
                // autofocus: true,
                controller: _idController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 5, 15),
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
                    hintText: "아이디를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
          )),
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
            child: TextFormField(
                // 전화번호 입력칸
                // autofocus: true,
                controller: _PnumController,
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
                    hintText: "전화번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
          )),
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
            child: TextFormField(
                // 비밀번호 입력칸
                // autofocus: true,
                controller: _authentication,
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
                    hintText: "발송된 인증번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
          )),
          Center(
              child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 30, 10),
            child: TextFormField(
                // 새 비밀번호 입력칸
                // autofocus: true,
                controller: _newpasswordController,
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
                    hintText: "새로운 비밀번호를 입력해주세요.",
                    hintStyle: TextStyle(fontSize: 12, color: Colors.black54)),
                keyboardType: TextInputType.text),
          )),
          Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 10, 30, 200),
              child: TextFormField(
                  // 비밀번호 확인 입력칸
                  // autofocus: true,
                  controller: _confirmPasswordController,
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
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("가입하기 버튼 클릭");
            },
            child: Text('비밀번호 변경하기'),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 44, 96, 68),
            ),
          ),
        ],
      ),
    );
  }
}
