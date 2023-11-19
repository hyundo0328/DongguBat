import 'package:donggu_bat/widgets/widget_bottombar.dart';
import 'package:flutter/material.dart';
import '../screens/main_page.dart';
import '../login/signup.dart';
import '../login/find_IDPW.dart';
import '../data/loading.dart';
import '../data/network.dart';
import '../screens/weather_screen.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class LogIn extends StatefulWidget {
  @override
  _LogInstate createState() => _LogInstate();
}

class _LogInstate extends State<LogIn> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // 더 이상 사용하지 않으면 메모리 낭비 방지를 위해서 dispose method를 사용 (추가)

  // dynamic parseWeatherData;

  // @override
  // void initState() {
  //   super.initState();
  //   getLocation();

  //   //updateData(parseWeatherData);
  //   print(parseWeatherData);
  // }

  // dynamic getLocation() async {
  //   // MyLocation myLocation = MyLocation();
  //   // await myLocation.getMyCurrentLocation();
  //   // latitude3 = myLocation.latitude2;
  //   // longitude3 = myLocation.longitude2;
  //   // print(latitude3);
  //   // print(longitude3);

  //   Network network = Network('https://api.openweathermap.org/data/2.5/weather?'
  //       'lat=37.550&lon=127.041&exclude=hourly&appid=$apiKey&units=metric');
  //   // https://api.openweathermap.org/data/3.0/onecall?lat=37.550&lon=127.041&exclude=hourly&appid=895c7d17476c72440ce44ba845661bbc&units=metric

  //   var weatherData = await network.getJsonData();
  //   print(weatherData);
  //   return WeatherScreen(
  //     parseWeatherData: weatherData,
  //   );
  // }

  // String? cityName;
  // double? temp;

  // void updateData(dynamic weatherData) {
  //   // double temp2 = weatherData['main']['temp'];
  //   if (weatherData != null && weatherData['main'] != null) {
  //     double temp2 = weatherData['main']['temp'];
  //     temp = double.parse(temp2.toStringAsFixed(1));
  //     cityName = weatherData['name'];

  //     print(temp);
  //     print(cityName);
  //   } else {
  //     print("날씨 정보를 불러오지 못함");
  //   }
  // }

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
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                              (route) => false);
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
