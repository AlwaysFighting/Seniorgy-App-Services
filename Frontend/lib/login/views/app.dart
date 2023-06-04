import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/login/views/login_page.dart';

import '../../const/bottom_nav.dart';
import 'onboarding_user_name.dart';

class AppBridgePage extends StatelessWidget {

  const AppBridgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          } else {
            User? user = snapshot.data;
            if (user != null && user.displayName == null) {
              return const OnBoardingUserName();
            } else {
              // 구글 로그인 후 첫 페이지로 표시할 페이지
              return const BottomNavigation();
            }
          }
        },
      ),
    );
  }
}
