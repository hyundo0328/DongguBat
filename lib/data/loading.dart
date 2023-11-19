// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// // import 'location.dart';
// import 'network.dart';
// import '../screens/main_page.dart';

// const apiKey = '895c7d17476c72440ce44ba845661bbc';

// class Loading extends StatelessWidget {
//   // late double latitude3;
//   // late double longitude3;

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   getLocation();
//   // }

  // dynamic getLocation() async {
  //   /* 위치 정보를 가져오는 코드 */
  //   // MyLocation myLocation = MyLocation();
  //   // await myLocation.getMyCurrentLocation();
  //   // latitude3 = myLocation.latitude2;
  //   // longitude3 = myLocation.longitude2;
  //   // print(latitude3);
  //   // print(longitude3);

  //   Network network = Network(
  //       'https://api.openweathermap.org/data/2.5/weather?lat=37.550&lon=127.041&exclude=hourly&appid=$apiKey&units=metric');
  //   // https://api.openweathermap.org/data/3.0/onecall?lat=37.550&lon=127.041&exclude=hourly&appid=895c7d17476c72440ce44ba845661bbc&units=metric

  //   var weatherData = await network.getJsonData();
  //   print(weatherData);
  //   return weatherData;
  // }

//   void fetchData() async {
//     http.Response response = await http.get(Uri.parse(
//         'https://api.openweathermap.org/data/2.5/weather?lat=37.550&lon=127.041&exclude=hourly&appid=$apiKey&units=metric'));
//     if (response.statusCode == 200) {
//       String jsonData = response.body;
//       var myJson = jsonDecode(jsonData)['weather'][0]['description'];
//       print(myJson);

//       var wind = jsonDecode(jsonData)['wind']['speed'];
//       print(wind);

//       var id = jsonDecode(jsonData)['id'];
//       print(id);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return getLocation();
//   }
// }
