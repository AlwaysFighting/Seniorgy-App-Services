import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../const/bottom_nav.dart';
import '../../const/color.dart';
import 'agreement_page.dart';
import 'onboarding_user_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Future<void> saveUIDToFirebaseFirestore(String uid) async {
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection('User');

    try {
      await usersCollection.add({'uid': uid});
      print('UID 데이터 업로드 완료');
    } catch (error) {
      print('UID 데이터 업로드 실패: $error');
    }
  }

  // Future<void> addCollection() async {
  //
  //   var user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     print('사용자가 인증되지 않았습니다.');
  //     return;
  //   }
  //
  //   print("user : $user");
  //
  //   String collectionPath = 'User';
  //   String documentId = user.uid;
  //
  //   CollectionReference collectionReference =
  //   FirebaseFirestore.instance.collection(collectionPath);
  //
  //   // 컬렉션 추가
  //   collectionReference
  //       .doc(documentId)
  //       .set({
  //     'register' : false,
  //     'login' : true,
  //   })
  //       .then((documentReference) {
  //     print('컬렉션 추가 완료');
  //   })
  //       .catchError((error) {
  //     print('컬렉션 추가 실패: $error');
  //   });
  // }

  // Google Login
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential;
  }

  // Kakao Login
  void _kakaoLoginState() async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) {
              return const BottomNavigation(currentIndex: 0,);
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
                return const OnBoardingUserName();
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
              return const OnBoardingUserName();
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
      backgroundColor: mainBlueColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 364.5,
                      child: Image.asset(
                        'assets/images/Login/DoorOpen.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 310),
                    child: Column(
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
                  ),
                  const SizedBox(height: 26),
                ],
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 47.0,
                  child: OutlinedButton(
                    onPressed: () {

                    },
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
              const SizedBox(height: 5.0),
              TextButton(
                onPressed: () {
                  print("로그인이 안되시나요?");
                },
                child: const Text(
                  '로그인이 안되시나요?',
                  style: TextStyle(
                    color: Color(0x60FFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
