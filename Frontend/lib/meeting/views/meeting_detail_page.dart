import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MeetingDetailPage extends StatefulWidget {
  const MeetingDetailPage({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MeetingDetailPage> createState() => _MeetingDetailPageState();
}

class _MeetingDetailPageState extends State<MeetingDetailPage> {

  final buttonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pretendard');

  final tagTextStyle = const TextStyle(
      color: Color(0xFF01CFFE),
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final textTextStyle = const TextStyle(
      color: Color(0xFF5D5D5D),
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final titleTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: 'Pretendard');

  final subTextTextStyle = const TextStyle(
      color: Color(0xFF878787),
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Pretendard');

  String formatTimestamp(Timestamp timestamp, String format) {
    DateTime dateTime = timestamp.toDate();
    String formattedDateTime = DateFormat(format).format(dateTime);
    return formattedDateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01CFFE),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('Search')
            .orderBy(FieldPath.documentId)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('ERROR'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == null) {
            return const Center(child: Text('데이터가 없습니다!'));
          }
          if (snapshot.connectionState == ConnectionState.done) {
            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            QueryDocumentSnapshot document = documents[widget.index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 260.0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: [
                          SizedBox(
                            height: 317,
                            width: double.infinity,
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 317,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0x0001CFFE),
                                  Color(0x6001CFFE),
                                  Color(0x8001CFFE),
                                  Color(0xFF01CFFE),
                                ],
                                stops: [0, 0.1, 0.2, 0.8],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 165,
                            left: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13.33),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 0),
                                    child: Center(
                                        child: Text(data['tag'],
                                            style: tagTextStyle)),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  data['subTitle'],
                                  style: titleTextStyle,
                                  softWrap: true,
                                  maxLines: 2,
                                ),
                                const SizedBox(height: 21.0),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 23,
                                      width: 23,
                                      child: Image.asset(
                                          "assets/images/Meeting/People.png",
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                        '${data['member']}/${data['max_member']}명',
                                        style: tagTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                    const SizedBox(width: 17.0),
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          "assets/images/Const/Calendar.png",
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(width: 6.0),
                                    Text(
                                        formatTimestamp(
                                            data['dateTime'], 'yyyy년 MM월 dd일'),
                                        style: tagTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    data['cheif_profile'],
                                    width: 47,
                                    height: 47,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF01CFFE),
                                      borderRadius:
                                      BorderRadius.circular(50.0),
                                    ),
                                    height: 20,
                                    width: 20,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 1.0, bottom: 1),
                                        child: SizedBox(
                                          height: 11,
                                          width: 11,
                                          child: Image.asset(
                                            "assets/images/Meeting/KingIcon.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(width: 12),
                            Text(data['cheif'], style: textTextStyle),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(data['content'], style: textTextStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400, height: 1.8),)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 72.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
            onPrimary: Colors.white,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: SizedBox(
                    height: 229,
                    width: 268,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: Column(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 74,
                              width: 74,
                              child: Image.asset(
                                "assets/images/Login/Pinky.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 17),
                          Text('가입을 진행하시겠습니까?', style: textTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0)),
                          const SizedBox(height: 38),
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/3.5,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFDBDBDC),
                                    ),
                                    child: Center(
                                      child: Text("취소", style: textTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/3.5,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                    ),
                                    child: Center(
                                      child: Text("확인", style: textTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Text(
            '다음',
            style: buttonTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
