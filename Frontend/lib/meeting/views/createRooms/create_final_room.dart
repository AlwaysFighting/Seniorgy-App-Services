import 'package:flutter/material.dart';

import '../../../const/bottom_nav.dart';
import '../../../const/color.dart';

class FinalCreateRoomSteps extends StatefulWidget {
  const FinalCreateRoomSteps({Key? key}) : super(key: key);

  @override
  State<FinalCreateRoomSteps> createState() => _FinalCreateRoomStepsState();
}

class _FinalCreateRoomStepsState extends State<FinalCreateRoomSteps> {

  final titleTextStyle = const TextStyle(
      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);

  final subTextStyle = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: const Color(0xFF4369ee),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Const/FinalStep.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 124.0),
                    ClipOval(
                      child: SizedBox(
                        height: 166.0,
                        width: 166.0,
                        child: Image.asset(
                          'assets/images/Picture/Picture1.png',
                          width: 31,
                          height: 31,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
              Column(
                children: [
                  Text("모임 만들기 완료", style: titleTextStyle,),
                  const SizedBox(height: 21.0),
                  Text("축하해요! 그룹 만들기를 완료했어요\n영시들과 함께 차근차근 시작해보세요", style: subTextStyle,),
                ],
              ),
              const SizedBox(height: 157.0),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 47,
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          print("친구 추가하기");
                        },
                        style: OutlinedButton.styleFrom(
                            // Border 색상 변경하기
                            side: const BorderSide(color: Colors.white),
                            // 모서리 둥글게 만들기
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(8.0),
                            ),
                            elevation: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Const/AddPerson.png',
                              width: 17,
                              height: 17,
                            ),
                            const SizedBox(width: 10.0),
                            Text("친구 추가하기", style: titleTextStyle.copyWith(fontSize: 16.0, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20.0),
                child: SizedBox(
                  height: 47,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print("완료!");
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomNavigation(currentIndex: 1,)),
                            (Route<dynamic> route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(8.0),
                        ),
                        elevation: 0),
                    child: Text("완료", style: titleTextStyle.copyWith(fontSize: 16.0, color: mainColor),),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
