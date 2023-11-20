import 'package:bridge/jjh/nickname.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'kakaologin.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double GetRealWidth({
    required double pixel,
    required BuildContext context,
  }) {
    double PX = MediaQuery.of(context).size.width / 390;
    return pixel * PX;
  }

//Return Real Height from Figma's Widget height
  double GetRealHeight({
    required double pixel,
    required BuildContext context,
  }) {
    double PX = MediaQuery.of(context).size.height / 844;
    return pixel * PX;
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: GetRealHeight(pixel: 214, context: context),
            ),
            // Container(
            //     width: GetRealWidth(pixel: 180, context: context),
            //     height: GetRealHeight(pixel: 40, context: context),
            //     child: Image(
            //       image: AssetImage("assets/images/app_icon/logo_main.png"),
            //       fit: BoxFit.fill,
            //     )),
            Text(
              "BRIDGE",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w700,
                  fontSize: 48),
            ),
            // SizedBox(
            //   height: GetRealHeight(pixel: 2, context: context),
            // ),
            Text(
              "크리에이터와 팬을 잇다",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(
              height: GetRealHeight(pixel: 326, context: context),
            ),
            Container(
              width: GetRealWidth(pixel: 285, context: context),
              height: GetRealHeight(pixel: 54, context: context),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(254, 229, 0, 1),
                  borderRadius: BorderRadius.circular(27)),
              child: InkWell(
                onTap: () async {
                  await kako()
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InputNickName()))
                      : null;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: GetRealWidth(pixel: 54, context: context),),
                    Image(
                        image:
                            AssetImage("assets/images/firstpage/Vector.png")),
                    SizedBox(width: GetRealWidth(pixel: 46.5, context: context),),
                    Text(
                      "카카오 로그인",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
