// 하이팅



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '49397fc59187797afb11e7d5ea37345a');
  runApp(MaterialApp(
    home: KaKaoLOGIN(),
  ));
}

// 카카오 로그인 구현 예제

// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
kako () async{
if (await isKakaoTalkInstalled()) {
  try {
      await UserApi.instance.loginWithKakaoTalk();
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
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        return true;
    } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
        return false;
    }
  }
} else {
  try {
    await UserApi.instance.loginWithKakaoAccount();
    print('카카오계정으로 로그인 성공');
    return true;
  } catch (error) {
    print('카카오계정으로 로그인 실패 $error');
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
class KaKaoLOGIN extends StatefulWidget {
  const KaKaoLOGIN({super.key});

  @override
  State<KaKaoLOGIN> createState() => _KaKaoLOGINState();
}

class _KaKaoLOGINState extends State<KaKaoLOGIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: OutlinedButton(onPressed: () {kako();}, child: Text("레슻고")),
        ),
      ),
    );
  }
}


