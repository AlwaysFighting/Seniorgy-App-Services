import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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

    await Hive.openBox('CreatedMTRooms');
    var box = Hive.box('CreatedMTRooms');

    FirebaseFirestore.instance
        .collection('MyCreatedRoom')
        .get()
        .then((QuerySnapshot snapshot) {
      int documentCount = snapshot.size + 1;
      collectionReference
          .doc(documentId)
          .collection('MyCreatedRoom')
          .add({
        "ID": documentCount,
        "KeyWord": box.get('KeyWord'),
        "MeetingType" : box.get('meetingType'),
        "Introduce" : box.get('introduce'),
        "Title" : box.get('title'),
        "Max_Member" : box.get('maxMember'),
        "Public" : box.get('public'),
        "Password" : box.get('password'),
        "DeptLat" : box.get('deptLat'),
        "DeptLng" : box.get('deptLng'),
      })
          .then((docRef) {
        print("새로운 모임방 생성 문서 ID: ${docRef.id}");
      })
          .catchError((error) {
        print("문서 생성 중 에러가 발생했습니다: $error");
      });
    });
  }

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
            updateRegisterField();
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
