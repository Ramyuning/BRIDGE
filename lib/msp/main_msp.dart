import 'package:bridge/msp/MyPage_Creator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '49397fc59187797afb11e7d5ea37345a');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white));
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage_Creator(),
  ));
}