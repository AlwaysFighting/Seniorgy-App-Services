import 'package:flutter/material.dart';

class MyMeetingChat extends StatefulWidget {
  const MyMeetingChat({Key? key}) : super(key: key);

  @override
  State<MyMeetingChat> createState() => _MyMeetingChatState();
}

class _MyMeetingChatState extends State<MyMeetingChat> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("MyMeetingChat"),
    );
  }
}
