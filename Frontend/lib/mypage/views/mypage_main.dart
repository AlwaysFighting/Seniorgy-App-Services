import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../login/views/login_page.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${snapshot.data?.displayName}님 반갑습니다."),
                  TextButton(
                    child: const Text("로그아웃"),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
