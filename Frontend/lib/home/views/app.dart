import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/login/views/login_page.dart';

import '../../const/bottom_nav.dart';

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
            return const BottomNavigation();
          }
        },
      ),
    );
  }
}
