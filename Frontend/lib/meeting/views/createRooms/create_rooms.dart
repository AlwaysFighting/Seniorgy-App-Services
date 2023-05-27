import 'package:flutter/material.dart';

import '../../../const/color.dart';
import '../../../const/custom_back.dart';
import 'create_room_location_step.dart';

class CreateRoomSettings extends StatefulWidget {
  CreateRoomSettings({Key? key}) : super(key: key);

  @override
  State<CreateRoomSettings> createState() => _CreateRoomSettingsState();
}

class _CreateRoomSettingsState extends State<CreateRoomSettings> {
  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: sub2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  List<String> titleList = ['동네 친구', '영웅', '굿즈', '투어', '스터디'];
  List<String> imgList = [
    'assets/images/Meeting/Smile.png',
    'assets/images/Meeting/Volunteer.png',
    'assets/images/Meeting/Goods.png',
    'assets/images/Meeting/Tour.png',
    'assets/images/Meeting/Study.png'
  ];

  bool _isNextButtonEnabled = false;
  int selectedGridIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
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
                              color: index == 0 ? mainColor : const Color(0xFFF4F4F4),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(index == 0 ? 8 : 0),
                                bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                                topRight: Radius.circular(index == 5 ? 8 : 0),
                                bottomRight: Radius.circular(index == 5 ? 8 : 0),
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
                          "1/",
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
              Text("관련 키워드를 하나만 골라주세요", style: titleTextStyle),
              const SizedBox(height: 12.0),
              Text("나중에 변경할 수 있어요.", style: subTextStyle),
              const SizedBox(height: 28.0),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 19.0,
                mainAxisSpacing: 20.0,
                crossAxisCount: 2,
                childAspectRatio: 1.217,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGridIndex = index;
                        _isNextButtonEnabled = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: selectedGridIndex == index
                            ? mainColor
                            : const Color(0xFFFAFAFB),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            imgList[index],
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(height: 16.0),
                          selectedGridIndex == index
                              ? Text(
                                  titleList[index],
                                  style: titleTextStyle.copyWith(
                                      color: Colors.white),
                                )
                              : Text(
                                  titleList[index],
                                  style: titleTextStyle,
                                )
                        ],
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20.0),
              NextButton(isNextButtonEnabled: _isNextButtonEnabled, selectedGridIndex: selectedGridIndex),
              const SizedBox(height: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required bool isNextButtonEnabled,
    required this.selectedGridIndex,
  }) : _isNextButtonEnabled = isNextButtonEnabled;

  final bool _isNextButtonEnabled;
  final int selectedGridIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          backgroundColor:
              _isNextButtonEnabled ? mainColor : buttonDisabledColor,
          elevation: 0,
        ),
        onPressed: () {
          if(_isNextButtonEnabled && selectedGridIndex == 0 || _isNextButtonEnabled && selectedGridIndex == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return CreateRoomLocation();
                }));
          }
        },
        child: const Text(
          "다음",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
