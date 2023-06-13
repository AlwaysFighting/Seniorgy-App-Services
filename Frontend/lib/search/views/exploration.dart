import 'package:flutter/material.dart';

import '../../const/color.dart';
import '../../meeting/views/meeting_detail_page.dart';

class ExplorationPage extends StatelessWidget {
  ExplorationPage({Key? key}) : super(key: key);

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

  List<String> categoryTitle = ['전체', '동네친구', '굿즈제작', '영웅봉사단', '영웅투어', '스터디'];

  List<String> imgURL = [
    'https://mobile.busan.com/nas/wcms/wcms_data/photos/2021/02/10/2021021009432993861_m.jpg',
    'https://www.gjtnews.com/news/photo/202006/313185_56164_4730.jpg',
    'https://thumb.mt.co.kr/06/2023/01/2023012511135323371_1.jpg/dims/optimize/',
    'https://file3.instiz.net/data/cached_img/upload/2021/07/06/9/fe69c8e8b31e599e84ea8013b0230e8e.jpg',
    'https://img.seoul.co.kr/img/upload/2021/05/28/SSI_20210528212749_O2.jpg'
  ];

  List<String> roomTitle = [
    '부천 영웅봉사단',
    '경기 영웅봉사단',
    '영시서구모임',
    '영웅굿즈단',
    '스밍스터디방'
  ];

  List<String> roomTag = [
    '봉사',
    '봉사',
    '동네친구',
    '굿즈',
    '스터디'
  ];

  List<String> roomSubTitle = [
    '부천에서 웅이의 영향력을 펼치다!',
    '경기에 영웅님의 사랑을 전하다',
    '서구 영시들과 친목타임!',
    '영웅이 굿즈를 만드는 방입니다.',
    '영웅이의 음원순위를 지켜라!!'
  ];

  List<int> keys = [4, 5, 3, 5, 1];

  List<int> maxPeople = [8, 8, 6, 5, 6];

  List<int> peoples = [7, 6, 4, 4, 2];

  List<String> characterImage = [
    'assets/images/Character/Ch1.png',
    'assets/images/Character/Ch2.png',
    'assets/images/Character/Ch3.png',
    'assets/images/Character/Ch4.png',
    'assets/images/Character/Ch5.png'
  ];

  List<double> characterWidth = [54.09, 59.13, 56.27, 54.09, 59.13];

  List<double> characterHeight = [50.93, 27.9, 45.77, 50.93, 28.0];

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
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 40.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SearchCategory(
                        title: '전체',
                        image: 'assets/images/Search/All_Color.png',
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0,
                            color: subBlueColor),
                      ),
                      const SizedBox(width: 14.0),
                      SearchCategory(
                        title: '동네친구',
                        image: 'assets/images/Search/Neighborhood_Grey.png',
                        textStyle: subTextTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 14.0),
                      SearchCategory(
                        title: '굿즈제작',
                        image: 'assets/images/Search/Goods_Grey.png',
                        textStyle: subTextTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 14.0),
                      SearchCategory(
                        title: '영웅봉사단',
                        image: 'assets/images/Search/Volunteer_Grey.png',
                        textStyle: subTextTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 14.0),
                      SearchCategory(
                        title: '영웅투어',
                        image: 'assets/images/Search/Tour_Grey.png',
                        textStyle: subTextTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(width: 14.0),
                      SearchCategory(
                        title: '스터디',
                        image: 'assets/images/Search/Study_Grey.png',
                        textStyle: subTextTextStyle.copyWith(
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 23.0,
                  right: 24.0,
                ),
                child: Column(
                  children: List.generate(
                      5,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (BuildContext context) {
                                      return MeetingDetailPage(index: index);
                                    }));
                              },
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
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
                                              padding: const EdgeInsets.only(
                                                  left: 14.0, top: 20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                  const SizedBox(height: 5.0),
                                                  Text(
                                                    roomSubTitle[index],
                                                    style: subTextStyle.copyWith(
                                                      fontWeight: FontWeight.w300,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 18.14,
                                                        width: 18.14,
                                                        child: Image.asset(
                                                          "assets/images/Meeting/People.png",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 5.0),
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
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                            const TextSpan(
                                                              text: '명',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF878787),
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(width: 18),
                                                      SizedBox(
                                                        height: 12.85,
                                                        width: 7.87,
                                                        child: Image.asset(
                                                          "assets/images/Meeting/Key.png",
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 4.0),
                                                      Text(
                                                        '${keys[index]}',
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xFF878787),
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.w300,
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
                            ),
                          )).toList(),
                ),
              )
            ],
          ),
        ));
  }
}

class SearchCategory extends StatelessWidget {
  const SearchCategory({
    super.key,
    required this.title,
    required this.image,
    required this.textStyle,
  });

  final String title;
  final String image;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 8.0),
      Text(
        title,
        style: textStyle,
      ),
    ]);
  }
}
