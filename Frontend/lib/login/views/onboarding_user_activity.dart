import 'package:flutter/material.dart';

import '../../const/color.dart';
import 'onboarding_user_group.dart';

class OnboardingUserActivity extends StatefulWidget {
  const OnboardingUserActivity({Key? key}) : super(key: key);

  @override
  State<OnboardingUserActivity> createState() => _OnboardingUserActivityState();
}

class _OnboardingUserActivityState extends State<OnboardingUserActivity> {
  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontFamily: 'PyeongChangPeace');

  final subTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

  final categoryTextStyle = const TextStyle(
      color: Color(0x90FFFFFF),
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: 'PyeongChangPeace');

  final buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  bool category1Checked = false;
  bool category2Checked = false;
  bool category3Checked = false;
  bool category4Checked = false;
  bool category5Checked = false;
  bool category6Checked = false;

  bool _isNextButtonEnabled = false;

  void _updateNextButtonState() {
    setState(() {
      _isNextButtonEnabled = category1Checked == true ||
          category2Checked == true ||
          category3Checked == true ||
          category4Checked == true ||
          category5Checked == true ||
          category6Checked == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/images/Const/Back_White.png',
            width: 31,
            height: 31,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, top: 20.0),
            child: Text("4/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
        backgroundColor: mainBlueColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '당신은 어떤 활동에\n관심이 있나요?',
                style: subTextStyle.copyWith(fontSize: 30.0),
              ),
              const SizedBox(height: 4.0),
              Text(
                '여러개 골라도 괜찮아요!',
                style: subTextStyle.copyWith(
                    fontSize: 20.0, fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 116,
                child: Image.asset(
                  "assets/images/Login/Pinky.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 255,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: SizedBox(
                        height: 255,
                        width: 330.0,
                        child: Image.asset(
                          "assets/images/Login/Category/Chat.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 19.0,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = false;
                                      category1Checked = !category1Checked;
                                      _updateNextButtonState();
                                    });
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 111,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category1Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          !category1Checked
                                              ? SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Study_Grey.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Study_Color.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          const SizedBox(width: 4.0),
                                          !category1Checked
                                              ? Text('스터디',
                                                  style: categoryTextStyle)
                                              : Text('스터디',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = false;
                                      category2Checked = !category2Checked;
                                      _updateNextButtonState();
                                    });
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 123,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category2Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          !category2Checked
                                              ? SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Tour_Grey.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Tour_Color.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          const SizedBox(width: 4.0),
                                          !category2Checked
                                              ? Text('영웅투어',
                                                  style: categoryTextStyle)
                                              : Text('영웅투어',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 17.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = false;
                                      category3Checked = !category3Checked;
                                      _updateNextButtonState();
                                    });
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 127,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category3Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          !category3Checked
                                              ? SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Goods_Grey.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child: Image.asset(
                                                    "assets/images/Login/Category/Goods_Color.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          const SizedBox(width: 4.0),
                                          !category3Checked
                                              ? Text('굿즈제작',
                                                  style: categoryTextStyle)
                                              : Text('굿즈제작',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = false;
                                      category4Checked = !category4Checked;
                                      _updateNextButtonState();
                                    });
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 143,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category4Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: !category4Checked
                                                ? Image.asset(
                                                    "assets/images/Login/Category/Volunteer_Grey.png",
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/Login/Category/Volunteer_Color.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          !category4Checked
                                              ? Text('영웅봉사단',
                                                  style: categoryTextStyle)
                                              : Text('영웅봉사단',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 17.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = false;
                                      category5Checked = !category5Checked;
                                      _updateNextButtonState();
                                    });
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category5Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: !category5Checked
                                                ? Image.asset(
                                                    "assets/images/Login/Category/Neighbor_Grey.png",
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.asset(
                                                    "assets/images/Login/Category/Neighbor_Color.png",
                                                    fit: BoxFit.cover,
                                                  ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          !category5Checked
                                              ? Text('동네친구',
                                                  style: categoryTextStyle)
                                              : Text('동네친구',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12.0),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      category6Checked = !category6Checked;
                                      category1Checked = false;
                                      category2Checked = false;
                                      category3Checked = false;
                                      category4Checked = false;
                                      category5Checked = false;
                                    });
                                    _updateNextButtonState();
                                  },
                                  child: Container(
                                    height: 39,
                                    width: 111,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0x70FFFFFF),
                                        width: 1,
                                      ),
                                      color: !category6Checked
                                          ? null
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 12.0),
                                      child: Center(
                                          child: !category6Checked
                                              ? Text('잘모르겠어',
                                                  style: categoryTextStyle)
                                              : Text('잘모르겠어',
                                                  style: categoryTextStyle
                                                      .copyWith(
                                                          color:
                                                              mainOrangeColor))),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
                !_isNextButtonEnabled ? const Color(0xFFDBDBDC) : Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            if (_isNextButtonEnabled == true) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const OnboardingUserGroup();
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
