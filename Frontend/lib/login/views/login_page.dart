import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../const/bottom_nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Google Login
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Kakao Login
  void _kakaoLoginState() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const BottomNavigation();
            }));
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const BottomNavigation();
              }));
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        print('카카오계정3으로 로그인하기?');
        await UserApi.instance.loginWithKakaoAccount();

        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const BottomNavigation();
            }));
        print('카카오계정3으로 로그인 성공');
      } catch (error) {
        print('카카오계정3으로 로그인 실패 $error');
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "로고",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 158),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _kakaoLoginState();
                    },
                    child: SizedBox(
                      height: 81.0,
                      width: 81.0,
                      child: Image.asset(
                        "assets/images/Login/KakaoLogin.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: SizedBox(
                      height: 81.0,
                      width: 81.0,
                      child: Image.asset(
                        "assets/images/Login/GoogleLogin.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: () {
                      print("네이버 로그인");
                    },
                    child: SizedBox(
                      height: 81.0,
                      width: 81.0,
                      child: Image.asset(
                        "assets/images/Login/NaverLogin.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 19.0),
            child: SizedBox(
              width: double.infinity,
              height: 47.0,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFD9D9D9),
                    primary: const Color(0xFFD9D9D9),
                    side: const BorderSide(color: Color(0xFFD9D9D9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15.0,
                      width: 15.0,
                      child: Image.asset(
                        "assets/images/Login/Mail.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Text("이메일로 로그인"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
