import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/login/views/login_page.dart';

import '../../const/bottom_nav.dart';
import 'agreement_page.dart';
import 'onboarding_user_name.dart';

class AppBridgePage extends StatelessWidget {
  const AppBridgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error occurred'),
            );
          } else if (!snapshot.hasData) {
            return const LoginPage();
          } else {
            User? user = snapshot.data;
            if (user != null && user.displayName == null) {
              return const OnBoardingUserName();
            } else {
              CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
              return StreamBuilder<QuerySnapshot>(
                stream: userCollection.where('uid', isEqualTo: user?.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error occurred'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data?.docs.isEmpty == true ||
                      snapshot.data?.docs.first.get('agreement') == false) {
                    return const AgreementPage();
                  }
                  if (snapshot.data?.docs.isEmpty == true ||
                      snapshot.data?.docs.first.get('register') == false) {
                    return const OnBoardingUserName();
                  }
                  // 구글 로그인 후 첫 페이지로 표시할 페이지
                  return const BottomNavigation();
                },
              );
            }
          }
        },
      ),
    );
  }
}
