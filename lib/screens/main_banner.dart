import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageInfo {
  final String imageUrl;
  final String linkUrl;

  PageInfo({required this.imageUrl, required this.linkUrl});
}

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  final List<PageInfo> pages = [
    PageInfo(
      imageUrl: 'assets/지원사업 참여 우수 수기 공모.png',
      linkUrl:
          'https://1in.seoul.go.kr/front/board/boardContentsView.do?board_id=1&contents_id=3154ac07f1444304acf393c00bf0982f',
    ),
    PageInfo(
      imageUrl: 'assets/세이프 라이딩.jpg',
      linkUrl: 'https://sd1in.net/',
    ),
    PageInfo(
      imageUrl: 'assets/실태조사.jpg',
      linkUrl:
          'https://form.office.naver.com/form/responseView.cmd?formkey=MzBjMWY3MmMtMTM0Yy00NjRlLThlYTEtYzQwN2VhZGEyMTcy&sourceId=urlshare',
    ),
  ];

  PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int _activePage = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _activePage = 0;
    _currentPage = 0;

    _pageController = PageController(initialPage: 0);

    // 타이머를 사용하여 페이지 자동으로 넘기기
    _timer = Timer.periodic(Duration(milliseconds: 5000), (Timer timer) {
      _currentPage++;
      _currentPage = _currentPage % 3;

      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void dispose() {
    // 상태가 해제된 위젯에서 setState를 호출하지 않도록 타이머를 취소합니다.
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 165,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  _launchURL(pages[index].linkUrl);
                },
                child: Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      pages[index].imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.contain,
                      alignment: Alignment(0.00, -1.00),
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: InkWell(
                      onTap: () {
                        _pageController.animateToPage(index,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      },
                      child: CircleAvatar(
                        radius: 3,
                        backgroundColor: _activePage == index
                            ? Colors.grey
                            : Colors.grey.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // URL을 열기 위한 함수
  _launchURL(String url) {
    if (url.isNotEmpty) {
      launch(url);
    } else {
      print("없는 주소");
    }
  }
}
