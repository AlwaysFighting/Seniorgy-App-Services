import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/const/color.dart';

import 'onboarding_finish2.dart';

class OnboardingFinish1Page extends StatefulWidget {
  const OnboardingFinish1Page({Key? key}) : super(key: key);

  @override
  State<OnboardingFinish1Page> createState() => _OnboardingFinish1PageState();
}

class _OnboardingFinish1PageState extends State<OnboardingFinish1Page> {

  final buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Login/RegisterFinish.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            const Text(
              '가입완료!\n모든 준비가 끝났습니다.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'PyeongChangPeace'),
              textAlign: TextAlign.center,
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const OnboardingFinish2Page();
                }));
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
