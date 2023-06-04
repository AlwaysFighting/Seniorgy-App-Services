import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
import 'create_final_room.dart';

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

  final _passwordController = TextEditingController();

  bool _isNextButtonEnabled = true;
  bool _isPublic = true;
  int _count = 1;

  void _updateLoginButtonState() {
    setState(() {
      if (!_isPublic) {
        _isNextButtonEnabled = _passwordController.text.isNotEmpty;
      } else {
        _isNextButtonEnabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const CustomBackBButton(),
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
                          width: (MediaQuery.of(context).size.width -
                                  21 -
                                  2 * 20) /
                              2,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isPublic = true;
                                _isNextButtonEnabled = true;
                              });
                            },
                            style: _isPublic
                                ? ElevatedButton.styleFrom(
                                    primary: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0,
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: const Color(0xFFF4F6F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0,
                                  ),
                            child: _isPublic
                                ? const Text(
                                    "공개",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : const Text(
                                    "공개",
                                    style: TextStyle(
                                      color: Color(0xFFAFABAB),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 21.0),
                        SizedBox(
                          height: 49,
                          width: (MediaQuery.of(context).size.width -
                                  21 -
                                  2 * 20) /
                              2,
                          child: ElevatedButton(
                            style: _isPublic
                                ? ElevatedButton.styleFrom(
                                    primary: const Color(0xFFF4F6F8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0,
                                  )
                                : ElevatedButton.styleFrom(
                                    primary: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 0,
                                  ),
                            onPressed: () {
                              setState(() {
                                _isPublic = false;
                                _isNextButtonEnabled = _passwordController.text.isNotEmpty;
                              });
                            },
                            child: _isPublic
                                ? const Text(
                                    "비공개",
                                    style: TextStyle(
                                      color: Color(0xFFAFABAB),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : const Text(
                                    "비공개",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 43.0),
                    !_isPublic
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("비밀번호",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                              const SizedBox(height: 20.0),
                              SizedBox(
                                height: 47.0,
                                width: double.infinity,
                                child: TextField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  onChanged: (value) {
                                    _updateLoginButtonState();
                                  },
                                  decoration: InputDecoration(
                                    hintText: "숫자네자리",
                                    hintStyle: subTextStyle.copyWith(
                                        color: const Color(0xFF878787)),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFE8EBEF), width: 1.0),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(24)),
                                      borderSide: BorderSide(
                                          width: 1, color: mainColor),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 15.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF4F6F8),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 85.0),
                            ],
                          )
                        : const SizedBox(height: 170.0),
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: ElevatedButton(
                          autofocus: false,
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) {
                                  return const FinalCreateRoomSteps();
                                }));
                          },
                          style: ElevatedButton.styleFrom(
                            // 메인 컬러
                            backgroundColor: _isNextButtonEnabled ? mainColor : buttonDisabledColor,
                            // 버튼 안 텍스트 스타일
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                            minimumSize: const Size(double.infinity, 358),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // 모서리 둥글기 정도
                            ),
                            elevation: 0,
                          ),
                          child: const Text("다음")
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
