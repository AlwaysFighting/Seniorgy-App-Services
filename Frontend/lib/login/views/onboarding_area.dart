import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/color.dart';
import 'onboarding_user_activity.dart';

class OnBoardingArea extends StatefulWidget {
  const OnBoardingArea({Key? key}) : super(key: key);

  @override
  State<OnBoardingArea> createState() => _OnBoardingAreaState();
}

class _OnBoardingAreaState extends State<OnBoardingArea> {

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

  final _textEditingController = TextEditingController();
  final _textEditingController2 = TextEditingController();

  bool _isNextButtonEnabled = false;
  bool isText1 = false;
  bool isText2 = false;

  void _updateText1State() {
    setState(() {
      isText1 = _textEditingController.text.isNotEmpty;
    });
  }

  void _updateText2State() {
    setState(() {
      isText2 = _textEditingController2.text.isNotEmpty;
    });
  }

  void _updateLoginButtonState() {
    setState(() {
      _isNextButtonEnabled = _textEditingController.text.isNotEmpty && _textEditingController2.text.isNotEmpty;
    });
  }

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
            child: Text("3/5",
                style: subTextStyle.copyWith(color: const Color(0x56FFFFFF))),
          )
        ],
        backgroundColor: mainBlueColor,
        elevation: 0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '당신은\n어디서 오셨나요??',
                    style: subTextStyle.copyWith(fontSize: 30.0),
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    height: 116,
                    child: Image.asset(
                      "assets/images/Login/Pinky.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 26.0),
                  SizedBox(
                    height: 299.0,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: SizedBox(
                            height: 299.0,
                            width: 330.0,
                            child: Image.asset(
                              "assets/images/Login/LoginMap.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 24.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '나는',
                                      style: subTextStyle.copyWith(fontSize: 20.0),
                                    ),
                                    const SizedBox(width: 5.0),
                                    SizedBox(
                                      width: 163.0,
                                      height: 43.0,
                                      child: TextField(
                                        onTap: () {

                                        },
                                        onChanged: (value) {
                                          _updateText1State();
                                          _updateLoginButtonState();
                                        },
                                        controller: _textEditingController,
                                        textAlign: TextAlign.center,
                                        style: !isText1 ? const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace') : const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
                                        decoration: InputDecoration(
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(bottom: 5.0),
                                          fillColor: !isText1 ? const Color(0x60EEEEEE) : Colors.white,
                                          hintText: '시/도',
                                          hintStyle: const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
                                          border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 13.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 119.0,
                                      height: 43.0,
                                      child: TextField(
                                        onChanged: (value) {
                                          _updateText2State();
                                          _updateLoginButtonState();
                                        },
                                        controller: _textEditingController2,
                                        textAlign: TextAlign.center,
                                        style: !isText2 ? const TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace') : const TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w300, fontFamily: 'PyeongChangPeace'),
                                        decoration: InputDecoration(
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(bottom: 5.0),
                                          fillColor: !isText2 ? const Color(0x60EEEEEE) : Colors.white,
                                          hintText: '시/군/구',
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
                                      '에서 왔어',
                                      style: subTextStyle.copyWith(fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
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
                    return const OnboardingUserActivity();
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

/* class DropdownOverlay {
  late CollectionReference<Map<String, dynamic>> regionCategory =
  FirebaseFirestore.instance.collection('Regional');

  static void show(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 500,
        left: 16,
        right: 16,
        child: Material(
          elevation: 4,
          child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
            future: DropdownOverlay().regionCategory.get(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                Map<String, dynamic> data =
                snapshot.data?.data() as Map<String, dynamic>;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data();
                    final formattedData = data.entries
                        .map((entry) => '${entry.key}: ${entry.value}')
                        .join(', ');
                    return ListTile(
                      title: Text(
                        formattedData,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        // 선택된 항목 처리
                        if (data.isNotEmpty) {
                          print('Selected item: $data');
                        }
                        overlayEntry?.remove();
                      },
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(overlayEntry);
  }
}
*/






