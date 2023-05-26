import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/const/color.dart';
import 'create_rooms.dart';

class MeetingPage extends StatelessWidget {
  MeetingPage({Key? key}) : super(key: key);

  final titleTextStyle = const TextStyle(
      color: mainTextColor, fontSize: 18, fontWeight: FontWeight.w800);

  final subTextStyle = const TextStyle(
      color: mainTextColor, fontSize: 12, fontWeight: FontWeight.w500);

  List<String> titleList = ['근처 친구 사귀기', '영웅봉사단', '영웅굿즈', '영웅투어', '덕질 스터디'];
  List<String> subTitleList = [
    '근처 영시들 모두 모여라!',
    '영웅이의 선한 영향력',
    '인형,큐브를 직업 만들자!',
    '영웅이의 발자취를 따라서',
    '내가수와 가까워지는 방법'
  ];

  List<String> imgList = [
    'assets/images/Meeting/CurrentLocation.png',
    'assets/images/Meeting/Volunteer.png',
    'assets/images/Meeting/Goods.png',
    'assets/images/Meeting/Car.png',
    'assets/images/Meeting/Study.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              print("Search");
            },
            child: Image.asset(
              'assets/images/Const/Magnifier.png',
              width: 42,
              height: 42,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Bell");
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 4, right: 20),
              child: Image.asset(
                'assets/images/Const/Bell.png',
                width: 42,
                height: 42,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text("내가 참여중인 모임", style: titleTextStyle),
              ),
              const SizedBox(height: 28.0),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("건행봉사단");
                        },
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/Meeting/Smile.png',
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              "건행봉사단",
                              style: subTextStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return CreateRoomSettings();
                              }));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 90.0,
                                  height: 90.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF3F3F7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/Const/Plus_grey.png',
                                      width: 36,
                                      height: 36,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "방 만들기",
                              style: subTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28.0),
              const CustomDivider(),
              const SizedBox(height: 40.0),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("영시들 다른 모임방", style: titleTextStyle),
                        const SizedBox(height: 40.0),
                        FixMeetingRooms(
                          titleTextStyle: titleTextStyle,
                          subTextStyle: subTextStyle,
                          title: '근처 친구 사귀기',
                          subTitle: '근처 영시들 모두 모여라!',
                          img: 'assets/images/Meeting/CurrentLocation.png',
                        ),
                        const SizedBox(height: 32.0),
                        FixMeetingRooms(
                          titleTextStyle: titleTextStyle,
                          subTextStyle: subTextStyle,
                          title: '영웅봉사단',
                          subTitle: '영웅이의 선한 영향력',
                          img: 'assets/images/Meeting/Volunteer.png',
                        ),
                        const SizedBox(height: 32.0),
                        FixMeetingRooms(
                          titleTextStyle: titleTextStyle,
                          subTextStyle: subTextStyle,
                          title: '영웅굿즈',
                          subTitle: '안형, 큐브를 직접 만들자!',
                          img: 'assets/images/Meeting/Goods.png',
                        ),
                        const SizedBox(height: 32.0),
                        FixMeetingRooms(
                          titleTextStyle: titleTextStyle,
                          subTextStyle: subTextStyle,
                          title: '영웅투어',
                          subTitle: '영웅이의 발자취를 따라서',
                          img: 'assets/images/Meeting/Tour.png',
                        ),
                        const SizedBox(height: 32.0),
                        FixMeetingRooms(
                          titleTextStyle: titleTextStyle,
                          subTextStyle: subTextStyle,
                          title: '덕질 스터디',
                          subTitle: '내가수와 가까워지는 방법들',
                          img: 'assets/images/Meeting/Study.png',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  const CustomDivider(),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("원하는 모임방이 없다면?", style: titleTextStyle),
                        const SizedBox(height: 28.0),
                        SizedBox(
                          height: 72,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFF2F3F6),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 21.57,
                                  width: 21.14,
                                  child: Image.asset(
                                    "assets/images/Const/Plus_Color.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20.0),
                                const Text(
                                  "새로운 모임방 개설하기",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 72.0),
            ],
          ),
        ),
      ),
    );
  }
}

class FixMeetingRooms extends StatelessWidget {
  const FixMeetingRooms({
    super.key,
    required this.titleTextStyle,
    required this.subTextStyle,
    required this.title,
    required this.subTitle,
    required this.img,
  });

  final TextStyle titleTextStyle;
  final TextStyle subTextStyle;

  final String title;
  final String subTitle;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleIcon(img: img),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleTextStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 14.0),
                  ),
                  const SizedBox(height: 9.0),
                  Text(
                    subTitle,
                    style: subTextStyle.copyWith(color: mainColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 74,
          height: 35,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFFE0EBFC),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
            onPressed: () {
              print("보러가기");
            },
            child: const Text(
              "보러가기",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: mainColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 57.0,
          height: 57.0,
          decoration: const BoxDecoration(
            color: Color(0xFFF3F3F7),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              img,
              width: 35.45,
              height: 35.45,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      width: MediaQuery.of(context).size.width,
      height: 8,
    );
  }
}
