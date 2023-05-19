import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home/views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
     MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const AppBridgePage(),
    ),
  );
}
