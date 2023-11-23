import 'package:flutter/material.dart';
import '../data/network.dart';
import 'loading.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class WeatherScreen extends StatefulWidget {
  // WeatherScreen({this.parseWeatherData});
  // final dynamic parseWeatherData;
  // dynamic parseWeatherData = Loading().getLocation();

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;

  dynamic parseWeatherData;

  @override
  void initState() {
    // super.initState();
    // parseWeatherData = Loading().getLocation();
    // updateData(widget.parseWeatherData);
    // updateData(parseWeatherData);
    // print(widget.parseWeatherData);
    // updateData(widget.parseWeatherData);
    parseWeatherData = Loading().getLocation();
    print(parseWeatherData);
  }

  @override
  void dispose() {
    // 상태가 해제된 위젯에서 setState를 호출하지 않도록 타이머를 취소합니다.
    super.dispose();
    // updateData(widget.parseWeatherData);
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
                  '${parseWeatherData['main']['temp']}',
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${parseWeatherData['name']}',
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

class Loading {
  // late double latitude3;
  // late double longitude3;
  // dynamic parseWeatherData;

  Future<dynamic> getLocation() async {
    // MyLocation myLocation = MyLocation();
    // await myLocation.getMyCurrentLocation();
    // latitude3 = myLocation.latitude2;
    // longitude3 = myLocation.longitude2;
    // print(latitude3);
    // print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather?'
        'lat=37.550&lon=127.041&exclude=hourly&appid=$apiKey&units=metric');
    // https://api.openweathermap.org/data/3.0/onecall?lat=37.550&lon=127.041&exclude=hourly&appid=895c7d17476c72440ce44ba845661bbc&units=metric

    var weatherData = await network.getJsonData();
    print(weatherData);
    print(weatherData['main']['temp']);
    print(weatherData['name']);
    return weatherData;
  }
}
