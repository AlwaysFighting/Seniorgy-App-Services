import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seniorgy_app_project/login/views/agreement_page.dart';
import 'package:seniorgy_app_project/login/views/login_page.dart';

import '../../const/bottom_nav.dart';

class AppBridgePage extends StatelessWidget {
  const AppBridgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData || snapshot.data?.uid == null) {
            return const LoginPage();
          } else {
            User? user = snapshot.data;
            if (user != null && user.uid.isNotEmpty) {
              CollectionReference userCollection = FirebaseFirestore.instance.collection('User');
              return StreamBuilder<DocumentSnapshot>(
                stream: userCollection.doc(user.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error occurred'),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data?.data() == null) {
                    return const LoginPage();
                  }
                  Map<String, dynamic>? userData = snapshot.data?.data() as Map<String, dynamic>?;
                  bool register = userData?['register'] ?? false;
                  if (register == false) {
                    return const AgreementPage();
                  } else {
                    return const BottomNavigation(currentIndex: 0,);
                  }
                },
              );
            } else {
              return const LoginPage();
            }
          }
        },
      )
    );
  }
}