import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../screens/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecommandPage extends StatefulWidget {
  @override
  State<RecommandPage> createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
  bool check_body = false;
  bool check_mind = false;
  bool check_relationship = false;
  bool check_finance = false;
  bool check_support = false;
  bool check_nothing = false;

  Widget buildButton({
    required String imagePath,
    required String label,
    required bool checkValue,
    required Function() onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            onPressed();
          });
          print(checkValue);
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          elevation: checkValue ? 6.0 : 0.0,
          shadowColor: Colors.black,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                imagePath,
                width: (MediaQuery.of(context).size.width - 80) / 3,
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            if (checkValue)
              Positioned(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
            Positioned(
              child: Opacity(
                opacity: checkValue ? 0.0 : 1.0,
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
        child: WidgetAppBar(title: "맞춤 추천 설정"),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  buildButton(
                    imagePath: 'assets/sport.jpeg',
                    label: '몸 건강',
                    checkValue: check_body,
                    onPressed: () => check_body = !check_body,
                  ),
                  buildButton(
                    imagePath: 'assets/heart.jpg',
                    label: '마음 건강',
                    checkValue: check_mind,
                    onPressed: () => check_mind = !check_mind,
                  ),
                  buildButton(
                    imagePath: 'assets/friendly.jpeg',
                    label: '관계 건강',
                    checkValue: check_relationship,
                    onPressed: () => check_relationship = !check_relationship,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildButton(
                    imagePath: 'assets/finance.jpeg',
                    label: '재무 건강',
                    checkValue: check_finance,
                    onPressed: () => check_finance = !check_finance,
                  ),
                  buildButton(
                    imagePath: 'assets/support.jpg',
                    label: '지원사업',
                    checkValue: check_support,
                    onPressed: () => check_support = !check_support,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          check_nothing = !check_nothing;
                          check_body = check_mind = check_relationship =
                              check_finance = check_support = false;
                        });
                        print(check_nothing);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        elevation: check_nothing ? 6.0 : 0.0,
                        shadowColor: Colors.black,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 80) / 3,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          if (check_nothing)
                            Positioned(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          // 텍스트를 클릭 시 숨기도록 변경
                          Positioned(
                            child: Opacity(
                              opacity: check_nothing ? 0.0 : 1.0,
                              child: Text(
                                '관심없음',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 96, 68),
                ),
                onPressed: () {
                  
                   if (FirebaseAuth.instance.currentUser != null) {
                    print("current user in the recommand page");
                    print(FirebaseAuth.instance.currentUser?.uid);}
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text(
                  '설정 완료하기',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
