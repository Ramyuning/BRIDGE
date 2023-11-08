import 'package:bridge/jjh/firstpage.dart';
import 'package:bridge/msp/SignIn_Creator.dart';
import 'package:flutter/material.dart';
import 'package:bridge/msp/viewstyle.dart';
import 'package:bridge/msp/functions.dart';
import 'package:bridge/msp/test/test_otp.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '49397fc59187797afb11e7d5ea37345a');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: InputFirstPage(),
  ));
}