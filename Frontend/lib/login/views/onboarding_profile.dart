import 'package:flutter/material.dart';

import '../../const/color.dart';

class OnBoardingProfile extends StatefulWidget {
  const OnBoardingProfile({Key? key}) : super(key: key);

  @override
  State<OnBoardingProfile> createState() => _OnBoardingProfileState();
}

class _OnBoardingProfileState extends State<OnBoardingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: mainBlueColor,
        elevation: 0,
      ),
      body: Center(
        child: Text("d"),
      ),
    );
  }
}
