import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/const/color.dart';
import '../../const/bottom_nav.dart';
import 'MyMeetingRoom/my_meeting_rooms.dart';
import 'createRooms/create_rooms.dart';

class MeetingPage extends StatelessWidget {
  MeetingPage({Key? key}) : super(key: key);

  final titleTextStyle = const TextStyle(
      color: blackTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final subTextStyle = const TextStyle(
      color: grey2TextColor,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard');

  final textTextStyle = const TextStyle(
      color: Color(0xFF353535),
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final subTextTextStyle = const TextStyle(
      color: Color(0xFF878787),
      fontSize: 14,
      fontWeight: FontWeight.w300,
      fontFamily: 'Pretendard');

  List<String> imgURL = [
    'https://mobile.busan.com/nas/wcms/wcms_data/photos/2021/02/10/2021021009432993861_m.jpg',
    'https://www.gjtnews.com/news/photo/202006/313185_56164_4730.jpg',
    'https://thumb.mt.co.kr/06/2023/01/2023012511135323371_1.jpg/dims/optimize/',
  ];

  List<String> roomTitle = [
    '부천 영웅봉사단',
    '경기 영웅봉사단',
    '영시서구모임',
  ];

  List<String> roomSubTitle = [
    '부천에서 웅이의 영향력을 펼치다!',
    '경기에 영웅님의 사랑을 전하다',
    '서구 영시들과 친목타임!',
  ];

  List<String> roomTag = [
    '봉사',
    '봉사',
    '동네친구',
    '굿즈',
    '스터디'
  ];

  List<int> keys = [4, 5, 3];

  List<int> maxPeople = [8, 8, 6];

  List<int> peoples = [7, 6, 4];

  List<String> characterImage = [
    'assets/images/Character/Ch1.png',
    'assets/images/Character/Ch2.png',
    'assets/images/Character/Ch3.png'
  ];

  List<double> characterWidth = [
    54.09, 59.13, 56.27
  ];

  List<double> characterHeight = [
    50.93, 27.9, 45.77
  ];

  final user = FirebaseAuth.instance.currentUser;

  Future<void> updateRegisterField() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('사용자가 인증되지 않았습니다.');
      return;
    }
  }

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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(user?.uid ?? "")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final userData = snapshot.data?.data() as Map<String, dynamic>?;
          return SingleChildScrollView(
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
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (BuildContext context) {
                                    return const MyMeetingRooms(title: '부천영웅봉사단', num: 8,);
                                  }));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://mobile.busan.com/nas/wcms/wcms_data/photos/2021/02/10/2021021009432993861_m.jpg',
                                      width: 92,
                                      height: 92,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    "부천영웅봉사단",
                                    style: subTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("대전친목방");
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.network(
                                      'https://cdn.gukjenews.com/news/photo/202209/2558912_2563317_3812.jpg',
                                      width: 92,
                                      height: 92,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  Text(
                                    "대전친목방",
                                    style: subTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
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
                                      width: 92.0,
                                      height: 92.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0x1001CFFE),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/Meeting/Plus.png',
                                          width: 36,
                                          height: 36,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10.0),
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
                            Text("'${userData?['UserName']}' 님을 위한 추천",
                                style: titleTextStyle.copyWith(
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(height: 24.0),
                            Column(
                              children: List.generate(
                                  3,
                                      (index) => Padding(
                                    padding:
                                    const EdgeInsets.only(bottom: 16.0),
                                    child: SizedBox(
                                      height: 120,
                                      width: double.infinity,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFEBEBEB),
                                            width: 1,
                                          ),
                                          color: null,
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12.0),
                                              child: Row(
                                                children: [
                                                  Center(
                                                    child: ClipOval(
                                                      child: Image.network(
                                                        imgURL[index],
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 14.0,
                                                        top: 20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: 23.0,
                                                              decoration: BoxDecoration(
                                                                color: subBlueColor,
                                                                borderRadius: BorderRadius.circular(100.0),
                                                              ),
                                                              child: Center(child: Padding(
                                                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                                child: Text(roomTag[index], style: textTextStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.white)),
                                                              )),
                                                            ),
                                                            const SizedBox(width: 8.0),
                                                            Text(
                                                              roomTitle[index],
                                                              style: textTextStyle,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 5.0),
                                                        Text(
                                                          roomSubTitle[index],
                                                          style: subTextStyle
                                                              .copyWith(
                                                            fontWeight:
                                                            FontWeight.w300,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 16.0),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 18.14,
                                                              width: 18.14,
                                                              child:
                                                              Image.asset(
                                                                "assets/images/Meeting/People_Grey.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 5.0),
                                                            RichText(
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                    '${peoples[index]}/${maxPeople[index]}',
                                                                    style:
                                                                    const TextStyle(
                                                                      color: Color(
                                                                          0xFF878787),
                                                                      fontSize:
                                                                      12.0,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                    ),
                                                                  ),
                                                                  const TextSpan(
                                                                    text: '명',
                                                                    style:
                                                                    TextStyle(
                                                                      color: Color(
                                                                          0xFF878787),
                                                                      fontSize:
                                                                      12.0,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 18),
                                                            SizedBox(
                                                              height: 12.85,
                                                              width: 7.87,
                                                              child:
                                                              Image.asset(
                                                                "assets/images/Meeting/Key.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 4.0),
                                                            Text(
                                                              '${keys[index]}',
                                                              style:
                                                              const TextStyle(
                                                                color: Color(
                                                                    0xFF878787),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w300,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: SizedBox(
                                                width: characterWidth[index],
                                                height: characterHeight[index],
                                                child: Image.asset(
                                                  characterImage[index],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )).toList(),
                            ),
                            const SizedBox(height: 16.0),
                            SizedBox(
                              height: 48.0,
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const BottomNavigation(currentIndex: 0)),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Color(0xFFEBEBEB)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  "더 보러가기",
                                  style: subTextStyle.copyWith(
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13.0),
                ],
              ),
            ),
          );
        },
      ),
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

class CharacterInfo {
  final String imageUrl;
  final double width;
  final double height;

  CharacterInfo({
    required this.imageUrl,
    required this.width,
    required this.height,
  });
}