import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../const/color.dart';
import '../../../const/custom_black_back.dart';
import '../../models/kakaomap.dart';
import 'create_room_introduce.dart';

class CreateRoomLocation extends StatefulWidget {
  const CreateRoomLocation({Key? key}) : super(key: key);

  @override
  State<CreateRoomLocation> createState() =>
      _CreateRoomLocationState();
}

class _CreateRoomLocationState
    extends State<CreateRoomLocation> {

  final titleTextStyle = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);

  final subTextStyle = const TextStyle(
      color: grey2TextColor, fontSize: 14, fontWeight: FontWeight.w400);

  final double deptLat = 37.62915393610253;
  final double deptLng = 127.09569185257587;

  hive() async {
    await Hive.openBox('CreatedMTRooms');

    var box = Hive.box('CreatedMTRooms');
    box.put('deptLat', deptLat);
    box.put('deptLng', deptLng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackBButton(),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(
                            6,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 8,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: index == 0 || index == 1
                                      ? subBlueColor
                                      : const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(index == 0 ? 8 : 0),
                                    bottomLeft:
                                        Radius.circular(index == 0 ? 8 : 0),
                                    topRight:
                                        Radius.circular(index == 5 ? 8 : 0),
                                    bottomRight:
                                        Radius.circular(index == 5 ? 8 : 0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              "2/",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            ),
                            Text(
                              "6",
                              style: titleTextStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  Text("활동 지역을 설정해주세요", style: titleTextStyle),
                  const SizedBox(height: 28.0),
                ],
              ),
            ),
          ),
          KakaoMapView(deptLat: deptLat, deptLng: deptLng,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 20.0),
                child: Column(
                  children: [
                    Text("서울 노원구",
                        style: titleTextStyle.copyWith(
                            fontSize: 16.0, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F8),
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 35.0,
              width: 145,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 15,
                        child: Image.asset(
                          "assets/images/Const/location_current.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        "주소 직접 수정하기",
                        style: subTextStyle.copyWith(
                            color: mainOrangeColor, fontSize: 12.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 72,
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0)),
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          onPressed: () {
            hive();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const IntroduceRooms();
                }));
          },
          child: const Text(
            "이 위치로 주소 설정하기",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      )
    );
  }
}
