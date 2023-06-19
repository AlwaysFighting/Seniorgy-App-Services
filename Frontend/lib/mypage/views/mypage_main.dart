import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../const/color.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    const profileTextStyle = TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w300,
        fontFamily: 'PyeongChangPeace');

    const textTextStyle = TextStyle(
        color: subBlueColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'Pretendard');

    const subTextTextStyle = TextStyle(
        color: Color(0xFF878787),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Pretendard');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              Icons.more_horiz_rounded,
              color: grey3TextColor,
              size: 36.0,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(user?.uid ?? "")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          final userData = snapshot.data?.data() as Map<String, dynamic>?;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Center(
                          child:  _buildUserImage(user?.uid ?? ""),
                        ),
                        const SizedBox(height: 40.0),
                        Center(
                          child: Text(
                            userData?['UserName'] ?? 'UnKnown!',
                            style: profileTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              Center(
                child: SizedBox(
                  height: 33,
                  width: 97,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6FAFF),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                  "assets/images/MyPage/Edit.png",
                                  fit: BoxFit.cover
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Text("프로필 수정", style: textTextStyle.copyWith(color: const Color(0xFF01CFFE))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22.0),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Container(
                  height: 117.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 55.0, right: 55.0, top: 25.0),
                        child: Column(
                          children: [
                            const Text("내 모임방", style: subTextTextStyle),
                            const SizedBox(height: 12.0),
                            Row(
                              children: [
                                SizedBox(
                                  height: 21.09,
                                  width: 16,
                                  child: Image.asset(
                                      "assets/images/MyPage/Doors.png",
                                      fit: BoxFit.cover
                                  ),
                                ),
                                const SizedBox(width: 9.0),
                                Text("${userData?['myMeetingRoom']}", style: textTextStyle.copyWith(fontWeight:FontWeight.w500, fontSize: 24.0),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 2,
                        height: 91.5,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 44.0, right: 48.0, top: 25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("가입일자", style: subTextTextStyle),
                            const SizedBox(height: 12.0),
                            Text('D + ${calculateDaysSinceSignUp(userData?['signupTime'])}', style: textTextStyle.copyWith(fontWeight:FontWeight.w500, fontSize: 24.0),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
  
  int calculateDaysSinceSignUp(Timestamp signupTime) {
    final currentTime = Timestamp.now();
    final difference = currentTime.toDate().difference(signupTime.toDate());
    return difference.inDays;
  }

  Widget _buildUserImage(String? uid) {
    if (uid != null) {
      String storagePath = 'users/$uid/images/Profile';

      return FutureBuilder<String>(
        future: FirebaseStorage.instance.ref().child(storagePath).getDownloadURL(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          String? imageUrl = snapshot.data;
          if (imageUrl != null) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 23.0, left: 23.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: subBlueColor,
                        width: 6,
                      ),
                      borderRadius: BorderRadius.circular(200.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: SizedBox(
                    height: 79,
                    width: 57,
                    child: Image.asset(
                        "assets/images/MyPage/Pinky.png",
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Icon(Icons.image);
          }
        },
      );
    } else {
      return const Icon(Icons.image);
    }
  }
}
