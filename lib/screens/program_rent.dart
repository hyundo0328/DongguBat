import 'package:donggu_bat/widgets/widget_bottombar.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgramApply extends StatefulWidget {
  @override
  State<ProgramApply> createState() => _ProgramApplyState();
}

class _ProgramApplyState extends State<ProgramApply> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  int _currentMonthIndex = 0;
  int _rentIndex = 0;
  String selectedLocation = '';
  String selectedname = '';

  List<String> _monthlyImages = [
    '1.png',
    '2.png',
    '3.png',
    '4.jpg',
    '5.png',
    'image.png',
    'rainbow.jpg',
    'SNS 인증샷.jpg',
    'user_progile.jpg',
    'vertical_symbol.jpg',
    '세이프 라이딩.jpg',
    '플로깅플레져.jpg'
  ];

  List<String> programurl = [
    'https://sd1in.net/product/stationery-collection',
    'https://sd1in.net/product/1inseoul',
    'https://sd1in.net/product/living-woodworking',
    'https://sd1in.net/product/free-drawing',
    'https://sd1in.net/product/personal-consultation',
    'https://sd1in.net/product/stationery-collection',
    'https://sd1in.net/product/1inseoul',
    'https://sd1in.net/product/living-woodworking',
    'https://sd1in.net/product/free-drawing',
    'https://sd1in.net/product/personal-consultation',
    'https://sd1in.net/product/free-drawing',
    'https://sd1in.net/product/personal-consultation'
  ];

  List<Map<String, String>> recommended = [
    {
      'location': '추천.png',
      'url': 'https://sd1in.net/product/personal-consultation',
      'text':
          '내담자는 미술치료에서의 공감으로 자기대상과의 관계에서 형성된 다양한 사고와 감정, 욕구를 자유롭게 표현할 수 있으며, 자기대상이 자신의 인생에 미친 영향을 탐색할 수 있게 됩니다. 치료자와 미술이라는 환경 속에서 내담자는 창조적이면서 공감적인 삶을 경험하게 되고, 자기의 발달과 회복이 촉진되는 것입니다.'
    }
  ];

  List<Map<String, String>> rent = [
    {'name': '5층 공유부엌', 'time': '10:00 - 12:00', 'location': '성동구 동1'},
    {'name': '4층 다목적실', 'time': '13:00 - 15:00', 'location': '성동구 동1'},
    {'name': '3층 소회의실', 'time': '10:00 - 12:00', 'location': '성동구 동1'},
    {'name': '3층 자치사랑방', 'time': '13:00 - 15:00', 'location': '성동구 동2'},
    {'name': '5층 공유부엌', 'time': '10:00 - 12:00', 'location': '성동구 동2'},
    {'name': '3층 작은도서관', 'time': '10:00 - 12:00', 'location': '성동구 동2'},
    {'name': '1층 다목적실', 'time': '10:00 - 12:00', 'location': '성동구 동1'},
    {'name': '5층 공유부엌', 'time': '10:00 - 12:00', 'location': '성동구 동1'},
    {'name': '5층 공유부엌', 'time': '10:00 - 12:00', 'location': '성동구 동1'},
  ];

  List<String> locations = ['성동구 동1', '성동구 동2', '성동구 동3'];
  List<String> name = ['소회의실', '자치사랑방', '공유부엌', '작은도서관', '다목적실'];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // 상단바, 하단바, 메인화면으로 나눌때 주로 사용
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0), // AppBar의 원하는 높이로 설정
          child: WidgetAppBar(title: "프로그램 신청"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  // 아이디 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 0, 6),
                    child: Text(
                      '당신을 위한 추천 (Recommand for You)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                //추천 하려고 하는 프로그램 띄우기 위한 container
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("프로그램 신청"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/${recommended[0]['location']}',
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                              SizedBox(height: 20),
                              Text('${recommended[0]['text']}'),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  String? url = recommended[0]['url'];
                                  if (url != null) {
                                    launch(url);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 44, 96, 68),
                                ),
                                child: Text("접수 바로가기"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/${recommended[0]['location']}',
                    fit: BoxFit.cover,
                    width: 400,
                    height: 100,
                  ),
                ),

                Align(
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 7),
                    child: Text(
                      '대관 신청 (Rental Application)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                            selectedLocation =
                                newValue ?? ''; // null 체크 및 대체값 설정
                          });
                        },
                        items: locations
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value), // 위치 이름
                          );
                        }).toList(),
                      ),
                    ),
                    //   Spacer(),
                    //   Icon(Icons.house_outlined),
                    //   SizedBox(width: 10),
                    //   Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 12),
                    //     decoration: BoxDecoration(
                    //       border: Border.all(),
                    //       borderRadius: BorderRadius.circular(5),
                    //     ),
                    //     child: DropdownButton<String>(
                    //       value: dropdownValue,
                    //       onChanged: (String? newValue) {
                    //         setState(() {
                    //           dropdownValue = newValue;
                    //           selectedname = newValue ?? ''; // null 체크 및 대체값 설정
                    //         });
                    //       },
                    //       items:
                    //           name.map<DropdownMenuItem<String>>((String value) {
                    //         return DropdownMenuItem<String>(
                    //           value: value,
                    //           child: Text(value), // 위치 이름
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                  ],
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: rent.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (selectedLocation.isEmpty ||
                          rent[index]['location'] == selectedLocation) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      rent[index]['name'] ?? '대관 위치 이름 없음',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    Spacer(), // 간격을 일정하게 설정하기 위해 Spacer 사용
                                    Text(
                                      '${rent[index]['time']}', // 대관 시간
                                    ),
                                    Spacer(), // 간격을 일정하게 설정하기 위해 Spacer 사용
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launch(
                                      'https://sd1in.net/program/application-for-rental');
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: Colors.black,
                                  side: BorderSide(color: Colors.grey),
                                ),
                                child: Text('신청하기'),
                              ),
                            ],
                          ),
                        );
                        // } else if (selectedname.isEmpty ||
                        //     rent[index]['name']!.contains(selectedname)) {
                        //   return Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Row(
                        //       children: [
                        //         Expanded(
                        //           child: Row(
                        //             children: [
                        //               Text(
                        //                 rent[index]['name'] ?? '대관 위치 이름 없음',
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),

                        //               Spacer(), // 간격을 일정하게 설정하기 위해 Spacer 사용
                        //               Text(
                        //                 '${rent[index]['time']}', // 대관 시간
                        //               ),
                        //               Spacer(), // 간격을 일정하게 설정하기 위해 Spacer 사용
                        //             ],
                        //           ),
                        //         ),
                        //         ElevatedButton(
                        //           onPressed: () {
                        //             launch(
                        //                 'https://sd1in.net/program/application-for-rental');
                        //           },
                        //           style: ElevatedButton.styleFrom(
                        //             primary: Colors.white,
                        //             onPrimary: Colors.black,
                        //             side: BorderSide(color: Colors.grey),
                        //           ),
                        //           child: Text('신청하기'),
                        //         ),
                        //       ],
                        //     ),
                        //   );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),

                Align(
                  // 아이디 텍스트
                  alignment: AlignmentDirectional(-1.00, 0.00),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 25, 0, 7),
                    child: Text(
                      '월간 프로그램 안내 (Monthly Program)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        '${_currentMonthIndex + 1} 월 추천 프로그램',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 200, // 이미지 높이 조절
                        child: CarouselSlider.builder(
                          itemCount: _monthlyImages.length,
                          options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 0.9,
                            aspectRatio: 16 / 9,
                            onPageChanged: (index, _) {
                              setState(() {
                                _currentMonthIndex = index;
                              });
                            },
                          ),
                          itemBuilder: (BuildContext context, int index, _) {
                            return Image.asset(
                              'assets/${_monthlyImages[index]}',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: WidgetBottomNavigationBar(
          selectedIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
