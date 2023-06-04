import 'package:flutter/material.dart';
import '../../const/color.dart';

class OnBoardingUserName extends StatefulWidget {
  const OnBoardingUserName({Key? key}) : super(key: key);

  @override
  State<OnBoardingUserName> createState() => _OnBoardingUserNameState();
}

class _OnBoardingUserNameState extends State<OnBoardingUserName> {
  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w700,
      fontFamily: 'PyeongChangPeace');

  final subTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
      fontFamily: 'PyeongChangPeace');

  final buttonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  bool showFirstText = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          showFirstText = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: loginBackgroundColor,
      appBar: AppBar(
        backgroundColor: loginBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, top: 20.0),
            child: Text("1/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showFirstText
                  ? Text(
                      "안녕하세요.",
                      style: subTextStyle.copyWith(fontSize: 30.0),
                    )
                  : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '영웅시대',
                              style: titleTextStyle,
                            ),
                            TextSpan(
                              text: '인 당신을',
                              style: subTextStyle.copyWith(fontSize: 30.0),
                            ),
                          ],
                        ),
                      ),
                  ),
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: showFirstText
                      ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '저는',
                                style: subTextStyle.copyWith(fontSize: 30.0),
                              ),
                              TextSpan(
                                text: '팬키',
                                style: titleTextStyle,
                              ),
                              TextSpan(
                                text: '에요!',
                                style: subTextStyle.copyWith(fontSize: 30.0),
                              ),
                            ],
                          ),
                        )
                      : Text(
                          '뭐라고 부르면 될까요?',
                          style: subTextStyle.copyWith(fontSize: 30.0),
                        )),
              const SizedBox(height: 32.0),
              SizedBox(
                height: 116,
                child: Image.asset(
                  "assets/images/Login/Pinky.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40.0),
              !showFirstText ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 156,
                        child: Image.asset(
                          "assets/images/Login/LoginChat.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 12.0,
                        right: 35.0,
                        child: Text(
                          '안녕 나는 영웅님의 팬',
                          style: subTextStyle.copyWith(fontSize: 20.0),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '예시) 부천웅',
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ) : Container(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFDBDBDC),
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {},
          child: Text(
            '다음',
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
