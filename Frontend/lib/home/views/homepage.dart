import 'package:flutter/material.dart';

import '../../const/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController = TextEditingController();

  List<String> titleList = ['새 친구 사귀기', '영웅봉사단'];
  List<String> subTitleList = ['아기 영시들!', '영웅이의 선한영향력!'];
  List<String> imgList = ['assets/images/Home/newFriend.png', 'assets/images/Home/angle.png'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: HomeSearch(searchController: searchController),
          actions: [
            IconButton(
              icon: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  "assets/images/Const/Bell.png",
                  fit: BoxFit.cover,
                ),
              ),
              onPressed: () {
                print("알림");
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 26.0, right: 20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("모임방1 클릭!");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(
                                "assets/images/Home/room1.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "영웅봉사단",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          print("모임방2 클릭!");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 65,
                              width: 65,
                              child: Image.asset(
                                "assets/images/Home/room2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "영웅봉사단",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Image.asset(
                          "assets/images/Home/home_body.png",
                          fit: BoxFit.cover,
                        ),
                        const Positioned(
                          top: 15.0,
                          child: Text(
                            "공릉2동에 2명의 영시가 있어요!",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26.0),
                    const CreateRoomBtn(),
                    const SizedBox(height: 5.0),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: titleList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return MeetingRoom(title: titleList[index], subTitle: subTitleList[index], img: imgList[index], index: index);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 모임방 직접 만들기 버튼
class CreateRoomBtn extends StatelessWidget {
  const CreateRoomBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)),
          elevation: 0,
        ),
        onPressed: () {
          print("모임방 직접 만들기");
        },
        child: const Text(
          "+ 모임방 직접 만들기",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// 모임방 리스
class MeetingRoom extends StatelessWidget {

  const MeetingRoom({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
    required this.index,
  });

  final String title;
  final String subTitle;
  final String img;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("모임방 $index");
      },
      child: Container(
          height: 156,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: const Color(0xFFEDEDED),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 12.0, right: 16.0, left: 14.0, top: 17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 11.0),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        color: Color(0xFF9A9A9A),
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      width: MediaQuery.of(context).size.width,
      height: 8,
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0, top: 5),
        child: TextField(
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          controller: searchController,
          autocorrect: false,
          decoration: InputDecoration(
            hintText: '원하는 모임방을 검색하세요.',
            hintStyle: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                print("Search!");
              },
              icon: Image.asset(
                "assets/images/Const/Magnifier.png",
                fit: BoxFit.cover,
                width: 20,
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
