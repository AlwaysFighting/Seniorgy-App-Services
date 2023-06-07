import 'dart:async';

import 'package:flutter/material.dart';

import '../../const/bottom_nav.dart';

class OnboardingFinish3Page extends StatefulWidget {
  const OnboardingFinish3Page({Key? key}) : super(key: key);

  @override
  State<OnboardingFinish3Page> createState() => _OnboardingFinish3PageState();
}

class _OnboardingFinish3PageState extends State<OnboardingFinish3Page> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), _navigateToNextPage);
  }

  void _navigateToNextPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const BottomNavigation(
                currentIndex: 0,
              )),
    );
  }

  final subTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/Login/CompletePage.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 180,
            left: 130,
            child: Text('저 너머의 관계로\n함께 나아가자! 얍!', style: subTextStyle),
          ),
        ],
      ),
    );
  }
}
