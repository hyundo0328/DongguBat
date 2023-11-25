import 'package:donggu_bat/widgets/widget_bottombar.dart';
import 'package:flutter/material.dart';
import '../widgets/widget_appbar.dart';
import '../widgets/widget_bottombar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../program/rent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramApply extends StatefulWidget {
  @override
  State<ProgramApply> createState() => _ProgramApplyState();
}

class _ProgramApplyState extends State<ProgramApply> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //1125 hys 추가 - uid 및 DB에서 현재 로그인한 사용자 정보 불러오기
  String? current_uid = FirebaseAuth.instance.currentUser?.uid; //사용자 uid
  String? current_email = FirebaseAuth.instance.currentUser?.email; //사용자 이메일
  String? current_name =
      FirebaseAuth.instance.currentUser?.displayName; //사용자 이름
  String? current_photo = FirebaseAuth.instance.currentUser
      ?.photoURL; //사용자 프로필 사진 주소(기본 설정 : 'assets/profile.png')
  String? current_address; //사용자 주소
  String? current_recommendlist; //사용자 선호 프로그램 목록
  String? recommend_img_url;
  String? recommend_url;
  String? recommend_text;
  List<String> locations = [];
  late Set<Map<String, String>> programDayExist = {};
  Future<void> fetchData() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("programData")
        .doc("0")
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> recommend = snapshot.data() as Map<String, dynamic>;
      recommend_img_url = recommend['이미지'];
      recommend_url = recommend['URL'];
      recommend_text = recommend["프로그램 소개"];
      // Now update the recommended list
      print(recommend_img_url);
    } else {
      print("error : 문서가 존재하지 않습니다!");
    }
  }

  //위에서 정의한 current 유저 정보 변수들에 DB에서 문서 읽어와 값 할당
  void set_current() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();

    // 문서가 존재하는지 확인
    if (documentSnapshot.exists) {
      // 문서의 데이터 가져오기
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      current_address = data['address'];
      current_recommendlist = data['recommend_list'];
    } else {
      print("error : 문서가 존재하지 않습니다!");
    }
  }

  void set_program() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('programData')
          .where('일정', isNotEqualTo: "")
          .get();

      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (QueryDocumentSnapshot document in documents) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;

        // 가져온 데이터 활용 예시 "이름", "일정", "카테고리"
        String scheduleName = data['이름'];
        String scheduleDate = data['일정'];
        String scheduleCat = data['카테고리'];

        programDayExist.add({
          'name': scheduleName,
          'time': scheduleDate,
          'location': scheduleCat
        });
        String newValue = scheduleCat; // 새로 추가하려는 값

        // 리스트에 값이 이미 있는지 확인
        if (!locations.contains(newValue)) {
          // 리스트에 추가
          locations.add(newValue);
        }
        // 원하는 작업 수행
        // print('문서 ID: $documentId, 일정: $scheduleData');
        // 이 부분에서 가져온 데이터를 저장하거나 활용할 수 있습니다.
      }
      //print(programDayExist);
      print(locations);
    } catch (error) {
      print('데이터 가져오기 실패: $error');
    }
  }

  //hys 1125 추가, 자동으로 currunt user 값들 세팅하기 위한 함수
  @override
  void initState() {
    super.initState();
    set_current();
    fetchData();
    set_program();
  }

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

  List<Map<String, String>> month = [
    {
      'photo': '1.png',
      'url': 'https://sd1in.net/product/stationery-collection'
    },
    {'photo': '2.png', 'url': 'https://sd1in.net/product/1inseoul'},
    {'photo': '3.png', 'url': 'https://sd1in.net/product/living-woodworking'},
    {'photo': '4.png', 'url': 'https://sd1in.net/product/1inseoul'},
    {'photo': '5.png', 'url': 'https://sd1in.net/product/living-woodworking'},
    {'photo': 'image.png', 'url': 'https://sd1in.net/product/1inseoul'},
    {'photo': '1.png', 'url': 'https://sd1in.net/product/living-woodworking'},
    {'photo': '2.png', 'url': 'https://sd1in.net/product/1inseoul'},
    {'photo': '3.png', 'url': 'https://sd1in.net/product/living-woodworking'},
    {'photo': '4.png', 'url': 'https://sd1in.net/product/1inseoul'},
    {'photo': '5.png', 'url': 'https://sd1in.net/product/living-woodworking'},
    {'photo': 'image.png', 'url': 'https://sd1in.net/product/1inseoul'},
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
                      '당신을 위한 추천 (Recommend for You)',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                //추천 하려고 하는 프로그램 띄우기 위한 container
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("프로그램 신청"),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  recommend_img_url ?? '',
                                  //fit: BoxFit.contain,
                                  //height: 200,
                                ),
                                SizedBox(height: 20),
                                Text(recommend_text ?? ''),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    String? url = recommend_url;
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
                          ),
                        );
                      },
                    );
                  },
                  child: Image.network(
                    recommend_img_url ?? '',
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
                    SizedBox(width: 20),
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
                            dropdownValue = newValue; // null 체크 및 대체값 설정
                            selectedLocation = newValue ?? ''; // 선택된 위치 업데이트

                            // 선택한 위치에 따라 필요한 동작 수행
                            // 예를 들어, 해당 위치에 대한 정보를 가져오거나 화면을 업데이트할 수 있습니다.
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
                  ],
                ),

                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: programDayExist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, String> programDay =
                          programDayExist.elementAt(index);

                      if (selectedLocation.isEmpty ||
                          programDay['location'] == selectedLocation) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      programDay['name'] ?? '대관 위치 이름 없음',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${programDay['time']}', // 대관 시간
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => rentPage(),
                                    ),
                                  );
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
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),

                Align(
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
                            return GestureDetector(
                              onTap: () {
                                String url =
                                    month[_currentMonthIndex]['url'] ?? '';
                                if (url.isNotEmpty) {
                                  launch(url);
                                }
                              },
                              child: Image.asset(
                                  'assets/${month[_currentMonthIndex]['photo']}'),
                            );
                            // return Image.asset(
                            //   'assets/${_monthlyImages[index]}',
                            //   fit: BoxFit.cover,
                            // );
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
