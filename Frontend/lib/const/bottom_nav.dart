import 'package:flutter/material.dart';

import '../hideout/views/hideout_main.dart';
import '../home/views/homepage.dart';
import '../mypage/views/mypage_main.dart';
import '../plaza/views/plaza_main.dart';
import 'color.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;

  // 현재 페이지를 나타낼 index
  int currentIndex = 0;

// 이동할 페이지 Widget
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const PlazaPage(),
    const HideOutPage(),
    const MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  BottomNavigationBar _bottomNavigation() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: sub2Text,
      selectedLabelStyle: const TextStyle(color: mainColor),
      unselectedLabelStyle: const TextStyle(color: sub2Text),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/HomeGrey.png',
              width: 28,
              height: 28,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/HomeColor.png',
              width: 28,
              height: 28,
            ),
          ),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/ClassGrey.png',
              width: 28,
              height: 28,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/ClassColor.png',
              width: 28,
              height: 28,
            ),
          ),
          label: '덕질교실',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/HideoutGrey.png',
              width: 28,
              height: 28,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/HideoutColor.png',
              width: 28,
              height: 28,
            ),
          ),
          label: '아지트',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MyProfile.png',
              width: 28,
              height: 28,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MyProfile.png',
              width: 28,
              height: 28,
            ),
          ),
          label: '내프로필',
        ),
      ],
    );
  }
}
