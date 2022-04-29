import 'package:flutter/material.dart';
import '../model/PageList.dart';


class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  final _pageController = PageController(initialPage: 0);

  void _onTap(int index) {
    _currentIndex = index;
    setState(() {

    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedFontSize: 12.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '微信',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '我',
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: pages,
      ),
    );
  }
}