import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:hive/hive.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'login/views/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterConfig.loadEnvVariables();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  await Hive.openBox('CreatedMTRooms');

  AuthRepository.initialize(appKey: '${FlutterConfig.get('KAKAOJAVAKEY')}');

  KakaoSdk.init(
    nativeAppKey: '${FlutterConfig.get('KAKAOLOGIN_APP_KEY')}',
  );
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AppBridgePage(),
    );
  }
}
