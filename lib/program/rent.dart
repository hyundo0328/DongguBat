import '../screens/program_rent.dart';
import 'package:flutter/material.dart';
import '../screens/main_page.dart';

class rentPage extends StatefulWidget {
  @override
  _rentPageState createState() => _rentPageState();
}

class _rentPageState extends State<rentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _PnumController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _purposeController = TextEditingController();
  int _selectedNumberOfPeople = 1;
  void _handlerent() {
    String name = _nameController.text;
    String pnum = _PnumController.text;
    String place = _placeController.text;
    String time = _timeController.text;
    String purpose = _purposeController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('대관신청'),
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
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '신청자 이름(Name)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _nameController,
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
                        hintText: '김성동',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '전화번호',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _PnumController,
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
                        hintText: '01012345678',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '대관시설',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _placeController,
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
                        hintText: '금호4가동 주민센터 - 5층 공유부엌',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '이용시간',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _timeController,
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
                        hintText: '09:00 ~ 11:00 (2시간)',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '이용인원',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: DropdownButtonFormField<int>(
                      value: _selectedNumberOfPeople,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedNumberOfPeople = newValue!;
                        });
                      },
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
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                    child: Text(
                      '이용 목적',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    child: TextFormField(
                      controller: _purposeController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.fromLTRB(15, 100, 5, 15),
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
                        hintText: '대관 시설의 이용목적을 작성해 주세요.',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProgramApply()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 44, 96, 68),
                  ),
                  child: Text('대관 신청하기'),
                ), // Add more form fields similarly
              ],
            ),
          ),
        ),
      ),
    );
  }
}
