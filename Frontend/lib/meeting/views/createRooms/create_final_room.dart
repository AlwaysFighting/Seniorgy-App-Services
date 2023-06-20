import 'package:flutter/material.dart';

import '../../../const/bottom_nav.dart';
import '../../../const/color.dart';

class FinalCreateRoomSteps extends StatefulWidget {
  const FinalCreateRoomSteps({Key? key}) : super(key: key);

  @override
  State<FinalCreateRoomSteps> createState() => _FinalCreateRoomStepsState();
}

class _FinalCreateRoomStepsState extends State<FinalCreateRoomSteps> {

  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

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
        padding: const EdgeInsets.only(top: 170.0),
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavigation(currentIndex: 1)),
                  (route) => false,
            );
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
