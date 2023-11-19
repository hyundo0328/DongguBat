import 'package:flutter/material.dart';
import '../data/network.dart';
import '../data/loading_practice.dart';

const apiKey = '895c7d17476c72440ce44ba845661bbc';

class WeatherScreen extends StatefulWidget {
  // WeatherScreen({this.parseWeatherData});
  // final dynamic parseWeatherData;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? cityName;
  int? temp;
  dynamic parseWeatherData;

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    parseWeatherData = Loading().getLocation();
    print(parseWeatherData);
    //updateData(parseWeatherData);
    print(parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    // temp = double.parse(temp2.toStringAsFixed(1));
    double temp2 = weatherData['main']['temp'];
    temp = temp2.round();
    cityName = weatherData['name'];

    print(temp);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {
    updateData(parseWeatherData);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38, width: 1.5),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
                        '$cityName',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '$temp',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Divider()
        ],
      ),
    );
  }
}
