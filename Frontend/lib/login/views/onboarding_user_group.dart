import 'package:flutter/material.dart';

import '../../const/color.dart';
import 'onboarding_finish1.dart';

class OnboardingUserGroup extends StatefulWidget {
  const OnboardingUserGroup({Key? key}) : super(key: key);

  @override
  State<OnboardingUserGroup> createState() => _OnboardingUserGroupState();
}

class _OnboardingUserGroupState extends State<OnboardingUserGroup> {

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

  bool offlineChecked = true;
  bool onlineChecked = true;
  bool allChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlueColor,
      appBar: AppBar(
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
            child: Text("5/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
        backgroundColor: mainBlueColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 20.0),
              child: Text(
                '당신은 어떤\n친구를 원하시나요?',
                style: subTextStyle.copyWith(fontSize: 30.0),
              ),
            ),
            const SizedBox(height: 73.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0, right: 43.68),
              child: SizedBox(
                height: 328,
                width: double.infinity,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          allChecked = false;
                          onlineChecked = false;
                          offlineChecked = true;
                        });
                      },
                      child: SizedBox(
                        height: 126.87,
                        child: offlineChecked ? Image.asset(
                          "assets/images/Login/GroupCategory/OfflineFriend_Color.png",
                          fit: BoxFit.cover,
                        ) : Image.asset(
                          "assets/images/Login/GroupCategory/OfflineFriend_Grey.png",
                          fit: BoxFit.cover,
                        ) ,
                      ),
                    ),
                    Positioned(
                      top: 100,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            allChecked = false;
                            onlineChecked = true;
                            offlineChecked = false;
                          });
                        },
                        child: SizedBox(
                          height: 127.92,
                          child: onlineChecked ? Image.asset(
                            "assets/images/Login/GroupCategory/OnlineFriend_Color.png",
                            fit: BoxFit.cover,
                          ) : Image.asset(
                            "assets/images/Login/GroupCategory/OnlineFriend_Grey.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100 + 100,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            allChecked = true;
                            onlineChecked = true;
                            offlineChecked = true;
                          });
                        },
                        child: SizedBox(
                          height: 127.48,
                          child: allChecked ? Image.asset(
                            "assets/images/Login/GroupCategory/Both_Color.png",
                            fit: BoxFit.cover,
                          ) : Image.asset(
                            "assets/images/Login/GroupCategory/Both_Grey.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, right: 47.0),
              child: SizedBox(
                height: 155,
                child: allChecked ? Image.asset(
                  "assets/images/Login/GroupCategory/Category_Active.png",
                  fit: BoxFit.cover,
                ) : Image.asset(
                  "assets/images/Login/GroupCategory/Category_Deactive.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary:
            Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const OnboardingFinish1Page();
            }));
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
