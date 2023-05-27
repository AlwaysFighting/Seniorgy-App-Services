import 'package:flutter/material.dart';
import '../../../const/color.dart';
import '../../../const/custom_back.dart';

class SettingRooms extends StatefulWidget {
  const SettingRooms({Key? key}) : super(key: key);

  @override
  State<SettingRooms> createState() => _SettingRoomsState();
}

class _SettingRoomsState extends State<SettingRooms> {
  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: sub2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  bool _isNextButtonEnabled = true;

  int _count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                            6,
                                (index) =>
                                Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width / 8,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: index == 0 ||
                                          index == 1 ||
                                          index == 2 ||
                                          index == 3 ||
                                          index == 4
                                          ? mainColor
                                          : const Color(0xFFF4F4F4),
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                        Radius.circular(index == 0 ? 8 : 0),
                                        bottomLeft:
                                        Radius.circular(index == 0 ? 8 : 0),
                                        topRight:
                                        Radius.circular(index == 5 ? 8 : 0),
                                        bottomRight:
                                        Radius.circular(index == 5 ? 8 : 0),
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              "5/",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "6",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Text("방의 특성을 설정해주세요", style: titleTextStyle),
                  const SizedBox(height: 60.0),
                  const Text("인원수",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(height: 20.0),
                  Container(
                    height: 48.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFF4F4F4),
                        width: 1,
                      ),
                      color: const Color(0xFFF4F6F8),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_count > 1) {
                                  _count--;
                                }
                              });
                            },
                            child: SizedBox(
                              width: 23,
                              height: 4,
                              child: Image.asset(
                                "assets/images/Const/Minus.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            _count.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: mainColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_count < 5) {
                                  _count++;
                                }
                              });
                            },
                            child: SizedBox(
                              height: 22.25,
                              width: 22.25,
                              child: Image.asset(
                                "assets/images/Const/Plus.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 44.0),
                  const Text("공개범주",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(height: 43.0),
                  Row(
                    children: [
                      SizedBox(
                        height: 49,
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width - 21 - 2 * 20) / 2,
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          style: ElevatedButton.styleFrom(
                            primary: mainColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 0,
                          ),
                          child: const Text("공개", style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                      ),
                      const SizedBox(width: 21.0),
                      SizedBox(
                        height: 49,
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width - 21 - 2 * 20) / 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFFF4F6F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {

                          },
                          child: const Text("비공개", style: TextStyle(
                            color: Color(0xFFAFABAB),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 43.0),
                  const Text("비밀번호",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
