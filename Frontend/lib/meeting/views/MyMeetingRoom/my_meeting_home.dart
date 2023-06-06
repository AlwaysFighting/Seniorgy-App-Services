import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/const/color.dart';

class MyMeetingHome extends StatefulWidget {
  const MyMeetingHome({Key? key}) : super(key: key);

  @override
  State<MyMeetingHome> createState() => _MyMeetingHomeState();
}

class _MyMeetingHomeState extends State<MyMeetingHome> {
  final tagTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final textTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Pretendard');

  final subTextTextStyle = const TextStyle(
      color: Color(0xFF878787),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pretendard');

  List<String> imgURL = [
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDRfODQg%2FMDAxNjIwMTAxNTk5ODYw.Zf_1Z8FJwsRbMwifdqXCm8yOtcrejozoIupDds9v_iQg.xvecfzZww_aGYQTLQgnrXCKdj8WweHv6KM5EUpF2PsAg.JPEG.yyyjjj2070%2F%25C0%25D3%25BF%25B5%25BF%25F5_2.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MThfMTYy%2FMDAxNjI2NjE0MzQ3Nzc1.MllxD6rkrUQeZzQuBYs3owH6uA6tDGofaad7tEenVDIg.HN7dsDNK1e9JDoA9Hczbv4OMoGXd1mIxFV4dFWV3wzgg.JPEG.yuillgirl%2Fresized%25A3%25DF1626429937448%25A3%25AD6.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTdfNTUg%2FMDAxNjMxODUyNzg1Nzc3.k_YYmmv-v-6ACAbNIJEZOQnwREkyWqXqeCcnbpqTPMAg.AP8oJWolul6oav28yd8v5ru0DqjA9-3-_4bR2wlO2fUg.JPEG.kweons2%2Fresized%25A3%25A5EF%25A3%25A5BC%25A3%25A5BF1631840712288.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MjhfNjgg%2FMDAxNjI3NDc1MzEzOTk3.Ob9WdisX8p_CJb4mDv25SwhBeJOLNS06IRBS7Hx50Zgg.fZmb5qpz4uvRNcN-llJxPzAWOxLtDI4yc2_2OTbySyYg.JPEG.woong1619%2F1627475160312%25A3%25AD0.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA2MDJfMjMx%2FMDAxNjIyNjM4NjMyODk0.zutL-UY4oUbknYsCDBHLbuymsNXfDtRodFG3e3DO0aYg.lZdIgPJ-XfLpJ5nc90eHJrRtvq6BsSCzyzvELgOd_5kg.JPEG.woong1619%2F1622638557270.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MjJfNDEg%2FMDAxNjMyMjYyMzY4MzU4.S5COx20Rs4ljCBXQkBGhYMoob1Ac_B7yZRuAh78u0S0g.2YWYhWsd_Qj9PemT9T75RHoY4Pt6nsrW1oveiu_h1b8g.JPEG.yuillgirl%2Fresized%25A3%25DF1632240184771%25A3%25AD3.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5095%2F2022%2F06%2F27%2F0000973191_003_20220627145201312.jpg&type=a340',
    'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MDhfMjMw%2FMDAxNjMxMDU2NTcyNzg0.D2xv_XNEpCUUQixt9DjegiXELFIZFifKRQX0OsdgS64g.AuJHrMjkYoshsJn6jTD0O1K1Cx1BEQ04rojrAfRQwGMg.JPEG.asn8891%2F1631054041362%25A3%25AD7.jpg&type=a340'
  ];

  List<String> memberName = [
    '짱웅',
    '웅치킨',
    '케찌',
    '영웅앓이',
    '하늘꼬꼬',
    '짱귤',
    '사랑웅',
    '영광이'
  ];

  List<String> characterImage = [
    'assets/images/Character/Youngci1.png',
    'assets/images/Character/Youngci2.png',
    'assets/images/Character/Youngci3.png',
    'assets/images/Character/Youngci4.png',
  ];

  List<double> characterWidth = [
    63.72, 65, 64, 63.72
  ];

  List<double> characterHeight = [
    60, 30.67, 48, 60
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      'https://file.mk.co.kr/meet/neds/2022/06/image_readtop_2022_516358_16551020075073743.jpg',
                      width: 93,
                      height: 93,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 24.0,
                        width: 52.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.33),
                          color: mainOrangeColor,
                        ),
                        child: Center(
                            child: Text(
                          "봉사",
                          style: tagTextStyle,
                        )),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '부천에서 영웅이의\n영향력을 펼치다! 부봉단!',
                        style: textTextStyle,
                      ),
                      const SizedBox(height: 6.0),
                      GestureDetector(
                        onTap: () {
                          print("모임 설정 변경하기!");
                        },
                        child: Row(
                          children: [
                            Text('모임 설정 변경하고 싶다면?', style: subTextTextStyle),
                            const SizedBox(width: 4.0),
                            SizedBox(
                              height: 14.0,
                              width: 14.0,
                              child: Image.asset(
                                "assets/images/Const/Back_Right_Key.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 31.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("5월 캘린더 보드", style: textTextStyle),
                  const SizedBox(height: 15.0),
                  Container(
                    width: double.infinity,
                    height: 260.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grey4TextColor,
                        width: 1,
                      ),
                      color: null,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 22.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text("15", style: textTextStyle.copyWith(fontSize: 14.0)),
                                  ),
                                  const SizedBox(width: 28.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("청소년쉼터 도시락 봉사", style: textTextStyle.copyWith(fontSize: 14.0)),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height : 11.5,
                                            width: 11.5,
                                            child: Image.asset(
                                              "assets/images/Meeting/Time.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text("오전 11:00", style: textTextStyle.copyWith(fontSize: 12.0, color: const Color(0xFFC8C8C8))),
                                          const SizedBox(width: 19.0),
                                          SizedBox(
                                            height : 11.5,
                                            width: 11.5,
                                            child: Image.asset(
                                              "assets/images/Meeting/Map.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text("종로구 13길 경복궁..", style: textTextStyle.copyWith(fontSize: 12.0, color: const Color(0xFFC8C8C8))),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              const CustomDivider2(color: Color(0xFFEBEBEB),),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text("16", style: textTextStyle.copyWith(fontSize: 14.0)),
                                  ),
                                  const SizedBox(width: 28.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("팀원들과 인사나누기", style: textTextStyle.copyWith(fontSize: 14.0)),
                                      const SizedBox(height: 5.0),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height : 11.5,
                                            width: 11.5,
                                            child: Image.asset(
                                              "assets/images/Meeting/Time.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text("오후 06:16", style: textTextStyle.copyWith(fontSize: 12.0, color: const Color(0xFFC8C8C8))),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              const CustomDivider2(color: Color(0xFFEBEBEB),),
                              const SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Text("17", style: textTextStyle.copyWith(fontSize: 14.0)),
                                  ),
                                  const SizedBox(width: 28.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("D+100 만난지 100일!!", style: textTextStyle.copyWith(fontSize: 14.0)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const CustomDivider2(color: Color(0xFFD9D9D9)),
                        const SizedBox(height: 13.0),
                        Center(child: Text('더 많은 일정 보기', style: subTextTextStyle.copyWith(fontWeight: FontWeight.w500),))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("세줄일기 모아보기", style: textTextStyle),
                  GestureDetector(
                    onTap: () {
                      print("모임 설정 변경하기!");
                    },
                    child: SizedBox(
                      height: 22.0,
                      width: 22.0,
                      child: Image.asset(
                        "assets/images/Const/Back_Right_Key.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(8, (index) => SingleChildScrollView(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFD9D9D9),
                          width: 1,
                        ),
                        color: null,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: characterHeight[index%4],
                              width: characterWidth[index%4],
                              child: Image.asset(
                                characterImage[index%4],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5.0,
                            top: 5.0,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: memberName[index],
                                    style: subTextTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: '의\n세줄일기',
                                    style: subTextTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("사진 동영상 모아보기", style: textTextStyle),
                  GestureDetector(
                    onTap: () {
                      print("사진 동영상 모아보기");
                    },
                    child: SizedBox(
                      height: 22.0,
                      width: 22.0,
                      child: Image.asset(
                        "assets/images/Const/Back_Right_Key.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imgURL[index],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
              ),
            ),
            const SizedBox(height: 40.0),
            const CustomDivider(),
            const SizedBox(height: 43.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("모임 멤버", style: textTextStyle),
                  const SizedBox(height: 20.0),
                  Column(
                    children: List.generate(
                        8,
                        (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                children: [
                                  index == 0
                                      ? Stack(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                imgURL[index],
                                                width: 42,
                                                height: 42,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFF01CFFE),
                                                  borderRadius:
                                                      BorderRadius.circular(50.0),
                                                ),
                                                height: 17.02,
                                                width: 17.02,
                                                child: Center(
                                                  child: SizedBox(
                                                    height: 9.36,
                                                    width: 9.36,
                                                    child: Image.asset(
                                                      "assets/images/Meeting/KingIcon.png",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      : ClipOval(
                                          child: Image.network(
                                            imgURL[index],
                                            width: 42,
                                            height: 42,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    memberName[index],
                                    style:
                                        textTextStyle.copyWith(fontSize: 14.0),
                                  )
                                ],
                              ),
                            )).toList(),
                  ),
                  const SizedBox(height: 100.0),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xFFF4F6F8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 0),
                      onPressed: () {
                        print("나가기");
                      },
                      child: Text(
                        "모임방 나가기",
                        style: textTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: 54.0),
                ],
              ),
            )
          ],
        ),
      ),
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

class CustomDivider2 extends StatelessWidget {
  const CustomDivider2({
    super.key, required this.color,
  });
  
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      height: 1,
    );
  }
}
