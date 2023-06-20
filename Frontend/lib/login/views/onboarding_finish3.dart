import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    Timer(const Duration(seconds: 2), _navigateToNextPage);
  }

  void _navigateToNextPage() {
    updateRegisterField();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BottomNavigation(currentIndex: 1)),
          (route) => false,
    );
  }

  Future<void> updateRegisterField() async {
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
        .update({
      'register': true,
      'signupTime':Timestamp.now(),
      'myMeetingRoom' : 0,
    })
        .then((_) {
      print('필드 업데이트 완료');
    })
        .catchError((error) {
      print('필드 업데이트 실패: $error');
    });

    // collectionReference
    //     .doc(documentId)
    //     .collection('MeetingRoom')
    //     .doc('1')
    //     .set({
    //   'field1': 1
    // });
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
            left: 120,
            child: Text('저 너머의 관계로\n함께 나아가자! 얍!', style: subTextStyle),
          ),
        ],
      ),
    );
  }
}
