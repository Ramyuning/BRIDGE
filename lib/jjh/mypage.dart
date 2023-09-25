import 'package:bridge/msp/functions.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Padding(
            padding: EdgeInsets.only(
                left: GetRealWidth(pixel: 20, context: context)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "마이페이지",
                      style: TextStyle(
                          fontFamily: "Pretendard",
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.menu,
                        size: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 50, context: context),
                ),
                Center(
                    child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.white,
                )),
                SizedBox(
                  height: GetRealHeight(pixel: 20, context: context),
                ),
                Center(
                    child: Container(
                  width: 162,
                  height: 66,
                  color: Colors.white,
                )),
                SizedBox(
                  height: GetRealHeight(pixel: 65, context: context),
                ),
                GestureDetector(
                  onTap: () {
                    print("프로필 편집 눌리;ㅁ");
                  },
                  child: Container(
                    width: GetRealWidth(pixel: 350, context: context),
                    height: GetRealHeight(pixel: 45, context: context),
                    decoration: BoxDecoration(color: Color.fromRGBO(88, 0, 255, 1),borderRadius:BorderRadius.circular(20)),
                      child: Center(
                    child: Text(
                      "프로필 편집",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Pretendard",
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                ),
                SizedBox(height: GetRealHeight(pixel: 70, context: context),),
                Container(width: GetRealWidth(pixel: 352, context: context),
           child: Divider(color: Colors.white30, thickness: 2.0)),
          //  SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
