import 'package:flutter/material.dart';
import '../data/network.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;
  // dynamic parseWeatherData;

  @override
  void initState() {
    // super.initState();
    // parseWeatherData = Loading().getLocation();
    // updateData(widget.parseWeatherData);
    // updateData(parseWeatherData);
    // print(widget.parseWeatherData);
  }

  @override
  void dispose() {
    // 상태가 해제된 위젯에서 setState를 호출하지 않도록 타이머를 취소합니다.
    super.dispose();
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    if (weatherData != null && weatherData['main'] != null) {
      double temp2 = weatherData['main']['temp'];
      temp = temp2.round();
      cityName = weatherData['name'];

      print(temp);
      print(cityName);
    } else {
      print("날씨 정보를 불러오지 못함");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Icon(Icons.cloud, size: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${cityName}',
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${temp}',
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
