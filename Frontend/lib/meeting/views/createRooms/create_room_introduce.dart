import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
import 'create_room_picture.dart';

class IntroduceRooms extends StatefulWidget {
  const IntroduceRooms({Key? key}) : super(key: key);

  @override
  State<IntroduceRooms> createState() => _IntroduceRoomsState();
}

class _IntroduceRoomsState extends State<IntroduceRooms> {

  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: grey2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  final _roomTitleController = TextEditingController();
  final _introduceRoomController = TextEditingController();
  bool _isNextButtonEnabled = false;

  bool isText1Read = true;
  bool isText2Read = true;

  void _updateLoginButtonState() {
    setState(() {
      _isNextButtonEnabled = _roomTitleController.text.isNotEmpty &&
          _introduceRoomController.text.isNotEmpty;
    });
  }

  hive() async {
    await Hive.openBox('CreatedMTRooms');

    var box = Hive.box('CreatedMTRooms');
    box.put('title', _roomTitleController.text);
    box.put('introduce', _introduceRoomController.text);
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
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
                                      color:
                                          index == 0 || index == 1 || index == 2
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
                                  "3/",
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
                      Text("방에 대해 소개해주세요", style: titleTextStyle),
                      const SizedBox(height: 60.0),
                      const Text("방이름", style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      )),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 47.0,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            TextField(
                              controller: _roomTitleController,
                              onChanged: (value) {
                                if (value.length > 20) {
                                  _roomTitleController.value = TextEditingValue(
                                    text: value.substring(0, 20),
                                    selection: const TextSelection.collapsed(offset: 20),
                                  );
                                }
                                _updateLoginButtonState();
                              },
                              decoration: InputDecoration(
                                hintText: "영웅 맛집 투어방",
                                hintStyle: subTextStyle.copyWith(
                                    color: const Color(0xFF878787)),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE8EBEF), width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                      BorderSide(width: 1, color: subBlueColor),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF4F6F8),
                              ),
                            ),
                            Positioned(
                              right: 16,
                              top: 15,
                              child: Text(
                                "${_roomTitleController.text.length}/20",
                                style: subTextStyle.copyWith(
                                    color: const Color(0xFF878787),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 44.0),
                      const Text("모임에 대해 소개해주세요.", style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      )),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        height: 200,
                        child: Stack(
                          children: [
                            TextField(
                              maxLines: 200,
                              controller: _introduceRoomController,
                              onChanged: (value) {
                                if (value.length > 500) {
                                  _introduceRoomController.value = TextEditingValue(
                                    text: value.substring(0, 500),
                                    selection: const TextSelection.collapsed(offset: 500),
                                  );
                                }
                                _updateLoginButtonState();
                              },
                              decoration: InputDecoration(
                                hintText: "영웅이가 다녀간 맛집을 함께 투어해요! 행복이 2배!",
                                hintStyle: subTextStyle.copyWith(color: const Color(0xFF878787)),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFE8EBEF), width: 1.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                                  borderSide:
                                  BorderSide(width: 1, color: subBlueColor),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF4F6F8),
                              ),
                            ),
                            Positioned(
                              bottom: 20.0,
                              right: 16.0,
                              child: Text(
                                "${_introduceRoomController.text.length}/500",
                                style: subTextStyle.copyWith(
                                    color: const Color(0xFF878787),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 86.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 72,
        width: double.infinity,
        child: ElevatedButton(
          autofocus: false,
          onPressed: () {
            if (_isNextButtonEnabled == true) {
              hive();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const UploadPictureRooms();
              }));
            }
          },
          style: ElevatedButton.styleFrom(
            // 메인 컬러
            backgroundColor:
                _isNextButtonEnabled ? Colors.black : buttonGreyColor,
            // 버튼 안 텍스트 스타일
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Colors.white,
            ),
            minimumSize: const Size(double.infinity, 358),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            elevation: 0,
          ),
          child: const Text('다음'),
        ),
      ),
    );
  }
}
