// 하이팅
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 카카오 로그인 구현 예제
// try {
//   await AuthCodeClient.instance.authorizeWithTalk(
//     redirectUri: '${REDIRECT_URI}',
//   );
// } catch (error) {
//   print('카카오톡으로 로그인 실패 $error');
// }
// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
Future _insave(token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String kakao_login = dotenv.get("kakao_login");
    final url = Uri.parse(kakao_login);
    Map data = {
      "token": "${token.accessToken}"
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      // 나중에 여기 주석처리 해제해서 사용.
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    // print();
    print(res.body.runtimeType);
    Map<String, dynamic> reslist = json.decode(res.body);
    print(reslist.runtimeType);
    print(reslist["access_token"]);
    await prefs.setString('access_token', reslist["access_token"]);
    await prefs.setString('refresh_token', reslist["refresh_token"]);
    // Map<String, dynamic> payload = json.decode(token);
    print(res.body);
    print(res.statusCode);
  }

kako () async{
if (await isKakaoTalkInstalled()) {
  try {
  //   await AuthCodeClient.instance.authorizeWithTalk(
  //   redirectUri: '${REDIRECT_URI}',
  // );
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      await _insave(token);
      print('카카오톡으로 로그인 성공');
      return true;
  } catch (error) {
    print('카카오톡으로 로그인 실패 $error');
    // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
    // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
    if (error is PlatformException && error.code == 'CANCELED') {
        return;
    }
    // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
    try {
    //     await AuthCodeClient.instance.authorize(
    // redirectUri: '${REDIRECT_URI}',);
        OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        await _insave(token);
        print('카카오계정으로 로그인 성공');
        return true;
        
    } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return false;
    }
  }
} else {
  try {
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    await _insave(token);
    print('카카오계정으로 로그인 성공');
    // await AuthCodeClient.instance.authorize(
    // redirectUri: '${REDIRECT_URI}',);
    return true;
  } catch (error) {
    print('카카오계정으로 로그인 실패 $error');
    return false;
  }
}
}

kakologout() async{
  try {
  await UserApi.instance.logout();
  print('로그아웃 성공, SDK에서 토큰 삭제');
} catch (error) {
  print('로그아웃 실패, SDK에서 토큰 삭제 $error');
}
}