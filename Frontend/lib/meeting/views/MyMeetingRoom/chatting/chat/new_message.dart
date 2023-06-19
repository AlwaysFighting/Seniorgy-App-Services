import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessge = '';
  void _sendMessage(){
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _userEnterMessge,
      'time' : Timestamp.now(),
      'userID' : user!.uid,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // Add your logic here for the 'Icons(add)' icon
            },
            icon: const Icon(Icons.add),
            color: Colors.grey,
          ),
          Expanded(
            child: TextField(
              maxLines : null,
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _userEnterMessge = value;
                });
              },
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
            color: Colors.grey,
          ),

          IconButton(
            onPressed: _userEnterMessge.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
