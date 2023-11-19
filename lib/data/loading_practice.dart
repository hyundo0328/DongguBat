import 'package:donggu_bat/screens/main_page.dart';
import 'package:flutter/material.dart';
// import 'my_location.dart';
import 'network.dart';
// import '../screens/weather_screen.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class Loading extends StatelessWidget {
  // late double latitude3;
  // late double longitude3;

  dynamic getLocation() async {
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
    return MainPage(
      parseWeatherData: weatherData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getLocation();
  }
}
