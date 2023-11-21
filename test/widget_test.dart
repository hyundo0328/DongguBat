import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PageInfo {
  final String imageUrl;
  final String linkUrl;

  PageInfo({required this.imageUrl, required this.linkUrl});
}

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
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

  late PageController _pageController;
  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 165,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Expanded(
            child: PageView.builder(
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
          ),
          Expanded(
            child: Center(
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
          ),
        ],
      ),
    );
  }

  // URL을 열기 위한 함수
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Invalid URL: $url');
    }
  }
}
