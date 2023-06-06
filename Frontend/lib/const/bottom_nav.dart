import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/meeting/views/meeting_main.dart';
import '../mypage/views/mypage_main.dart';
import '../search/views/exploration.dart';
import 'color.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.currentIndex}) : super(key: key);
  final int currentIndex;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;

  // 현재 페이지를 나타낼 index
  int currentIndex = 0;

// 이동할 페이지 Widget
  final List<Widget> _widgetOptions = <Widget>[
    ExplorationPage(),
    MeetingPage(),
    const MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

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
      unselectedItemColor: const Color(0xFF878787),
      unselectedLabelStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
      selectedLabelStyle: const  TextStyle(
          color: mainColor, fontWeight: FontWeight.w700, fontFamily: 'PyeongChangPeace'),
      selectedItemColor: mainOrangeColor,
      selectedFontSize: 14,
      unselectedFontSize: 14,
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
              'assets/images/Navigation/SearchGrey.png',
              width: 48,
              height: 48,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/SearchColor.png',
              width: 48,
              height: 48,
            ),
          ),
          label: '탐색',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MeetingRoom_Grey.png',
              width: 48,
              height: 48,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MeetingRoom_Color.png',
              width: 48,
              height: 48,
            ),
          ),
          label: '모임방',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MyProfileGrey.png',
              width: 48,
              height: 48,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/images/Navigation/MyProfileColor.png',
              width: 48,
              height: 48,
            ),
          ),
          label: '마이페이지',
        ),
      ],
    );
  }
}
