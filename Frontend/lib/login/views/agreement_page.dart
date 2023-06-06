import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/login/views/onboarding_user_name.dart';

import '../../const/color.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({Key? key}) : super(key: key);

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final subTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pretendard');

  final buttonStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("약관", style: titleTextStyle),
            const SizedBox(height: 28.0),
            Text('팬도라에 가입하려면, 각 항목의 “자세히 보기” 링크를 클릭해서 개인 정보 처리 방식을 이해해야 합니다.',
                style: subTextStyle),
            const SizedBox(height: 37.0),
            Row(
              children: [
                SizedBox(
                  width: 18.0,
                  height: 18.0,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => isChecked
                          ? null
                          : const BorderSide(width: 1.0, color: Colors.white),
                    ),
                    checkColor: mainBlueColor,
                    activeColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 7.0),
                Text("전체 약관 동의", style: subTextStyle.copyWith(fontSize: 16.0)),
              ],
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 27.0, top: 35.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => isChecked
                                  ? null
                                  : const BorderSide(
                                      width: 1.0, color: Colors.black),
                            ),
                            checkColor: Colors.white,
                            activeColor: mainOrangeColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Text("팬도라 이용약관",
                            style: subTextStyle.copyWith(
                                fontSize: 16.0, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 21.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => isChecked
                                  ? null
                                  : const BorderSide(
                                      width: 1.0, color: Colors.black),
                            ),
                            checkColor: Colors.white,
                            activeColor: mainOrangeColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Text("개인정보 수집 및 이용목적 동의",
                            style: subTextStyle.copyWith(
                                fontSize: 16.0, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(height: 21.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 18.0,
                          height: 18.0,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => isChecked
                                  ? null
                                  : const BorderSide(
                                      width: 1.0, color: Colors.black),
                            ),
                            checkColor: Colors.white,
                            activeColor: mainOrangeColor,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Text("제 3자 개인정보 제공 동의",
                            style: subTextStyle.copyWith(
                                fontSize: 16.0, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: isChecked ? Colors.black : const Color(0xFFDBDBDC),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)
            ),
            elevation: 0,
          ),
          onPressed: () {
            if (isChecked == true) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const OnBoardingUserName();
                  }));
            }
          },
          child: Text('동의 후 가입', style: buttonStyle),
        ),
      ),
    );
  }
}
