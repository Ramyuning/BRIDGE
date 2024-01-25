import 'package:bridge/jjh/callrecord_user.dart';
import 'package:bridge/jjh/edit_profile_user.dart';
import 'package:bridge/jjh/finish_page.dart';
import 'package:bridge/jjh/firstpage.dart';
import 'package:bridge/jjh/followed_creator_page.dart';
import 'package:bridge/jjh/mypage_user.dart';
// import 'package:bridge/jjh/inputtext.dart';
import 'package:bridge/jjh/nickname.dart';
import 'package:bridge/jjh/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  KakaoSdk.init(nativeAppKey: '49397fc59187797afb11e7d5ea37345a');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage(),
  ));
}
