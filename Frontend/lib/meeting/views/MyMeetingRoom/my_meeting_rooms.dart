import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/meeting/views/MyMeetingRoom/my_meeting_chat.dart';
import 'package:seniorgy_app_project/meeting/views/MyMeetingRoom/my_meeting_mission.dart';

import '../../../const/color.dart';
import 'my_meeting_home.dart';

class MyMeetingRooms extends StatefulWidget {
  const MyMeetingRooms({Key? key, required this.title, required this.num})
      : super(key: key);
  final String title;
  final int num;

  @override
  State<MyMeetingRooms> createState() => _MyMeetingRoomsState();
}

class _MyMeetingRoomsState extends State<MyMeetingRooms> {

  final titleTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final tabTextStyle = const TextStyle(
      color: grey2TextColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard');

  final activeTabTextStyle = const TextStyle(
      color: mainOrangeColor,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  final List<Tab> myTabs = [
    const Tab(text: '홈'),
    const Tab(text: '미션'),
    const Tab(text: '채팅'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  DefaultTabController(
        initialIndex: 2,
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            centerTitle: true,
            elevation: 0,
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.title,
                    style: titleTextStyle,
                  ),
                  TextSpan(
                    text: '  ${widget.num}',
                    style: titleTextStyle.copyWith(color: const Color(0xFF878B93)),
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              tabs: myTabs,
              labelStyle: activeTabTextStyle,
              labelColor: mainOrangeColor,
              unselectedLabelColor: const Color(0xFFD9D9D9),
              unselectedLabelStyle: tabTextStyle,
              indicatorColor: mainOrangeColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4.0,
            ),
          ),
          body: const TabBarView(
            children: [
              // 첫 번째 탭 페이지
              MyMeetingHome(),
              // 두 번째 탭 페이지
              MyMeetingMission(),
              // 세 번째 탭 페이지
              MyMeetingChat(),
            ],
          ),
        ),
      ),
    );
  }
}
