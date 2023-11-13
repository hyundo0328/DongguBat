//main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DongguBat',
      home: LogIn(),
    );
  }
}

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
                            TextField(
                                autofocus: true,
                                controller: controller1,
                                decoration:
                                    InputDecoration(labelText: 'Enter ID'),
                                keyboardType: TextInputType.emailAddress),
                            TextField(
                              controller: controller2,
                              decoration:
                                  InputDecoration(labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                minWidth: 100,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color.fromARGB(255, 44, 96,
                                          68)), // background onPrimary: Colors.white
                                  onPressed: () {
                                    if (controller1.text == 'hyundo' &&
                                        controller2.text == '1234') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Main()));
                                    } else if (controller1.text == 'hyundo' &&
                                        controller2.text != '1234') {
                                    } else if (controller2.text != 'hyundo' &&
                                        controller2.text != '1234') {
                                    } else {}
                                  },
                                  child: Text('로그인'),
                                ))
                          ]),
                        )))
              ],
            ),
          ),
        );
      },
    ));
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
          appBar: AppBar(
            title: Text('메인페이지'),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 44, 96, 68),

            // leading : 아이콘 버튼이나 간단한 위젯을 왼쪽에 배치할 때 사용

            // actions : 복수의 아이콘 버튼 등을 오른쪽에 배치할 때 사용
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("search button is clicked");
                },
              ),
            ],
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/vertical_symnbol.jpg'),
                ),
                accountName: Text('hyundo'),
                accountEmail: Text('hyundo13@naver.com'),
                onDetailsPressed: () {
                  print('arrow is clicked');
                },
              ),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 35,
            selectedItemColor: const Color.fromARGB(255, 44, 96, 68),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontSize: 10),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: '목록'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
            ],
          )),
    );
  }
}

