import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'login/views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterConfig.loadEnvVariables();

  // API 키 가져오기
  KakaoSdk.init(
    nativeAppKey: '${FlutterConfig.get('KAKAOLOGIN_APP_KEY')}',
  );

  runApp(
      const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppBridgePage(),
    ),
  );
}
