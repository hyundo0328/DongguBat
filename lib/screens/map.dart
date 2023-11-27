// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapSample extends StatefulWidget {
//   @override
//   _MapSampleState createState() => _MapSampleState();
// }

// class _MapSampleState extends State<MapSample> {
//   Completer<GoogleMapController> _controller = Completer();

//   // 이 값은 지도가 시작될 때 첫 번째 위치입니다.
//   CameraPosition _currentPosition = CameraPosition(
//     target: LatLng(37.550, 127.041),
//     zoom: 12, //확대
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: double.infinity,
//         width: double.infinity,
//         child: GoogleMap(
//           initialCameraPosition: _currentPosition,
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete();
//           },
//         ),
//       ),
//     );
//   }
// }
