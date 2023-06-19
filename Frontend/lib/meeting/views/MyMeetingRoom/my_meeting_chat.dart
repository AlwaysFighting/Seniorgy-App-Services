import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'chatting/chat/message.dart';
import 'chatting/chat/new_message.dart';

class MyMeetingChat extends StatefulWidget {
  const MyMeetingChat({Key? key}) : super(key: key);

  @override
  State<MyMeetingChat> createState() => _MyMeetingChatState();
}

class _MyMeetingChatState extends State<MyMeetingChat> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: const [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ),
    );
  }
}
