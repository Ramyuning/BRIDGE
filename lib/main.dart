import 'package:bridge/jjh/firstpage.dart';
import 'package:bridge/jjh/inputtext.dart';
import 'package:bridge/jjh/nickname.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '49397fc59187797afb11e7d5ea37345a');
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}
