import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/const/color.dart';

import 'onboarding_finish3.dart';

class OnboardingFinish2Page extends StatefulWidget {
  const OnboardingFinish2Page({Key? key}) : super(key: key);

  @override
  State<OnboardingFinish2Page> createState() => _OnboardingFinish2PageState();
}

class _OnboardingFinish2PageState extends State<OnboardingFinish2Page> {

  final buttonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  final titleTextStyle = const TextStyle(
      color: mainOrangeColor,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'PyeongChangPeace');

  final subTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0, left: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 245,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/Login/CompleteChat.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('저 문 너머에 다른', style: subTextStyle),
                            const SizedBox(height: 5.0),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '영시 친구',
                                    style: titleTextStyle,
                                  ),
                                  TextSpan(
                                    text: '들이 기다리고 있어요!',
                                    style: subTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text('함께 친구들을 만나러 가봐요!', style: subTextStyle),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 26.0),
            SizedBox(
              height: 203,
              width: 123.01,
              child: Image.asset(
                "assets/images/Login/CompleteKey.png",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const OnboardingFinish3Page();
            }));
          },
          child: Text(
            '다음',
            style: buttonTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
