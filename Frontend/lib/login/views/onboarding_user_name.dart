import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seniorgy_app_project/login/views/onboarding_profile.dart';
import '../../const/bottom_nav.dart';
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

  final _textEditingController = TextEditingController();
  bool _isNextButtonEnabled = false;

  void _updateLoginButtonState() {
    setState(() {
      _isNextButtonEnabled = _textEditingController.text.isNotEmpty;
    });
  }

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      appBar: AppBar(
        backgroundColor: mainBlueColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/Const/Back_White.png',
            width: 31,
            height: 31,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, top: 20.0),
            child: Text("1/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
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
                !showFirstText ? SizedBox(
                  height: 156,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        child: SizedBox(
                          width: 307.45,
                          child: Image.asset(
                            "assets/images/Login/LoginChat.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 12.0),
                              Text(
                                '안녕 나는 영웅님의 팬',
                                style: subTextStyle.copyWith(fontSize: 20.0),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 200.0,
                                    height: 36.0,
                                    child: TextField(
                                      onChanged: (value) {
                                        _updateLoginButtonState();
                                      },
                                      controller: _textEditingController,
                                      textAlign: TextAlign.center,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.singleLineFormatter,
                                        LengthLimitingTextInputFormatter(8),
                                      ],
                                      style: !_isNextButtonEnabled ? const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace') : const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
                                      decoration: InputDecoration(
                                        filled: true,
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 9),
                                        fillColor: !_isNextButtonEnabled ? const Color(0x20EEEEEE) : Colors.white,
                                        hintText: '예시) 부천웅',
                                        hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
                                        border: UnderlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    '야',
                                    style: subTextStyle.copyWith(fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: !_isNextButtonEnabled ? const Color(0xFFDBDBDC) : Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            if (_isNextButtonEnabled == true) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const OnBoardingProfile();
                  }));
            }
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
