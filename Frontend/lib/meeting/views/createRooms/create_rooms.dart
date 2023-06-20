import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
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
      color: grey2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  List<String> titleList = ['동네친구', '봉사', '굿즈', '투어', '스터디'];

  List<String> colorImgList = [
    'assets/images/Meeting/Neighbor_Color.png',
    'assets/images/Meeting/Volunteer_Color.png',
    'assets/images/Meeting/Gift_Color.png',
    'assets/images/Meeting/Tour_Color.png',
    'assets/images/Meeting/Study_Color.png'
  ];

  List<String> unSelectedImgList = [
    'assets/images/Meeting/Neighbor_Grey.png',
    'assets/images/Meeting/Volunteer_Grey.png',
    'assets/images/Meeting/Gift_Grey.png',
    'assets/images/Meeting/Tour_Grey.png',
    'assets/images/Meeting/Study_Grey.png'
  ];

  List<String> selectedImgList = [
    'assets/images/Meeting/Neighbor_White.png',
    'assets/images/Meeting/Volunteer_White.png',
    'assets/images/Meeting/Gift_White.png',
    'assets/images/Meeting/Tour_White.png',
    'assets/images/Meeting/Study_White.png'
  ];

  bool _isNextButtonEnabled = false;
  int selectedGridIndex = -1;

  Future<void> updateRegisterField(int roomID, int ) async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('사용자가 인증되지 않았습니다.');
      return;
    }

    String collectionPath = 'User';
    String documentId = user.uid;

    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(collectionPath);

    collectionReference
        .doc(documentId)
        .collection('TemporaryRoom')
        .doc('TemporaryVar')
        .update({
      "id" : 0,

    })
        .then((_) {
      print('필드 업데이트 완료');
    })
        .catchError((error) {
      print('필드 업데이트 실패: $error');
    });

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
                              color: index == 0 ? subBlueColor : const Color(0xFFF4F4F4),
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
                            ? subBlueColor
                            : const Color(0xFFFAFAFB),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isNextButtonEnabled == true)...[
                            selectedGridIndex == index && _isNextButtonEnabled == true ? Image.asset(
                              selectedImgList[index],
                              width: 50,
                              height: 50,
                            ) : Image.asset(
                              unSelectedImgList[index],
                              width: 50,
                              height: 50,
                            ),
                          ] else...[
                            Image.asset(
                              colorImgList[index],
                              width: 50,
                              height: 50,
                            ),
                          ],
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: NextButton(isNextButtonEnabled: _isNextButtonEnabled, selectedGridIndex: selectedGridIndex),
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
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0)),
          backgroundColor:
              _isNextButtonEnabled ? Colors.black : const Color(0xFFDBDBDC),
          elevation: 0,
        ),
        onPressed: () {
          if(_isNextButtonEnabled && selectedGridIndex == 0 || _isNextButtonEnabled && selectedGridIndex == 1) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const CreateRoomLocation();
                }));
          }
        },
        child: const Text(
          "다음",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
