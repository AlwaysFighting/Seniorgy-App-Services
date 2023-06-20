import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
import 'create_final_room.dart';

class CreateRoomMeeting extends StatefulWidget {
  const CreateRoomMeeting({Key? key}) : super(key: key);

  @override
  State<CreateRoomMeeting> createState() => _CreateRoomMeetingState();
}

class _CreateRoomMeetingState extends State<CreateRoomMeeting> {

  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: grey2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  final buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  bool isChecked = false;
  int index = 0;

  List<String> defaultImgList = [
    'assets/images/Meeting/Offline_Default.png',
    'assets/images/Meeting/Online_Default.png',
    'assets/images/Meeting/Both_Default.png',
  ];

  List<String> unSelectedImgList = [
    'assets/images/Meeting/Offline_Deselect.png',
    'assets/images/Meeting/Online_Deselect.png',
    'assets/images/Meeting/Both_Deselect.png',
  ];

  List<String> selectedImgList = [
    'assets/images/Meeting/Offline_Color.png',
    'assets/images/Meeting/Online_Color.png',
    'assets/images/Meeting/Both_Color.png',
  ];

  hive() async {
    await Hive.openBox('CreatedMTRooms');

    var box = Hive.box('CreatedMTRooms');
    box.put('meetingType', index);
    var dla = box.get('meetingType');
    print('meetingType: $dla');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackBButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Row(
                              children: List.generate(
                                6,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 8,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: index == 0 ||
                                          index == 1 ||
                                          index == 2 ||
                                          index == 3 ||
                                          index == 4 ||
                                          index == 5
                                          ? subBlueColor
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
                                  "6/",
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
                      Text("어떤 영시들이 모이길 원하세요?", style: titleTextStyle),
                      const SizedBox(height: 67.0),
                      Center(
                        child: SizedBox(
                          height: 327.46,
                          width: 248.32,
                          child: Stack(
                            children: [
                              if (isChecked == false) ...[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      index = 0;
                                      isChecked = true;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 126.87,
                                    width: 235.38,
                                    child: Image.asset(
                                      defaultImgList[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = 1;
                                        isChecked = true;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 127.92,
                                      width: 248.19,
                                      child: Image.asset(
                                        defaultImgList[1],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 200,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = 2;
                                        isChecked = true;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 127.48,
                                      width: 211.02,
                                      child: Image.asset(
                                        defaultImgList[2],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ] else ...[
                                if (index == 0 && isChecked == true) ...[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = 0;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 126.87,
                                      width: 235.38,
                                      child: Image.asset(
                                        selectedImgList[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 1;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.92,
                                        width: 248.19,
                                        child: Image.asset(
                                          unSelectedImgList[1],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 200,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 2;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.48,
                                        width: 211.02,
                                        child: Image.asset(
                                          unSelectedImgList[2],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else if (index == 1 && isChecked == true) ...[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = 0;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 126.87,
                                      width: 235.38,
                                      child: Image.asset(
                                        unSelectedImgList[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 1;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.92,
                                        width: 248.19,
                                        child: Image.asset(
                                          selectedImgList[1],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 200,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 2;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.48,
                                        width: 211.02,
                                        child: Image.asset(
                                          unSelectedImgList[2],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ] else ...[
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        index = 0;
                                      });
                                    },
                                    child: SizedBox(
                                      height: 126.87,
                                      width: 235.38,
                                      child: Image.asset(
                                        unSelectedImgList[0],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 100,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 1;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.92,
                                        width: 248.19,
                                        child: Image.asset(
                                          unSelectedImgList[1],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 200,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          index = 2;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 127.48,
                                        width: 211.02,
                                        child: Image.asset(
                                          selectedImgList[2],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 155.07,
                    width: 267.89,
                    child: Image.asset(
                        "assets/images/Meeting/MeetingPanky.png",
                        fit: BoxFit.cover
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
            isChecked ? Colors.black : buttonGreyColor,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            if(isChecked == true) {
              hive();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const FinalCreateRoomSteps();
                  }));
            }
          },
          child: Text(
            '다음',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
