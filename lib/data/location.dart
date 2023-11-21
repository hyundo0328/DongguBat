import 'package:geolocator/geolocator.dart';

// 본인의 위치에 따라 날씨를 보여주고 싶을 때 위치 정보 가져오는 위젯
class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print(latitude2);
      print(longitude2);
    } catch (e) {
      print('There was a problem with the internet connection.');
    }
  }
}
