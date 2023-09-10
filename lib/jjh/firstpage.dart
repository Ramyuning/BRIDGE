import 'package:bridge/jjh/nickname.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding:
              EdgeInsets.only(left: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 214, context: context),
              ),
              Text(
                "Bridge",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 35),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 40, context: context),
              ),
              Text(
                "크리에이터와 팬을 잇다",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              Text(
                "${statusBarHeight}",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 300, context: context),
              ),
              InkWell(
                onTap: () async {
                  await kako() ? Navigator.push(context, MaterialPageRoute(builder: (context) => InputNickName())) : null;
                  
                },
                child: Image(image: AssetImage("assets/images/image5.png")),
              ),
              // InkWell(child: Ink.image(image: AssetImage("assets/image/image 5.jpg")),),
            ],
          ),
        ),
      ),
    );
  }
}
