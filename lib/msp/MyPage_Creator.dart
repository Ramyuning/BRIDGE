import 'package:bridge/msp/Classes.dart';
import 'package:flutter/material.dart';
import 'package:bridge/msp/functions.dart';
import 'package:bridge/jjh/callrecord_user.dart';
import 'package:bridge/jjh/edit_profile_user.dart';
import 'package:bridge/jjh/followed_creator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Link_SocialPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Link Clicked!");
      },
      child: Container(
        height: GetRealHeight(pixel: 50, context: context),
        width: GetRealWidth(pixel: 50, context: context),
        decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 1),
        ),
      ),
    );
  }

}

class StateIndicator extends StatefulWidget {
  @override
  State<StateIndicator> createState() => _StateIndicatorState();
}

class _StateIndicatorState extends State<StateIndicator> {
  @override
  Widget build(BuildContext context)
  {
    return Container();
  }
}

class Followed_creator extends StatelessWidget {
  late double height_PX;
  late double width_PX;
  Followed_creator({super.key, required double height, required double width}) {
    height_PX = height;
    width_PX = width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height_PX * 150,
      width: width_PX * 122,
      child: Column(
        children: [
          Container(
            height: height_PX * 122,
            width: height_PX * 122,
            decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.circular(8)),
          ),
          Text(
            "크리에이터",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Pretendard",
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPage_Creator extends StatefulWidget {
  const MyPage_Creator({super.key});

  @override
  State<MyPage_Creator> createState() => MyPage_CreatorState();
}

class MyPage_CreatorState extends State<MyPage_Creator> {
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(64, 0, 185, 1)),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight,
              // left: GetRealWidth(pixel: 20, context: context)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: GetRealWidth(pixel: 19, context: context),
                      top: GetRealHeight(pixel: 20, context: context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: GetRealWidth(pixel: 122, context: context),
                        height: GetRealHeight(pixel: 28, context: context),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "마이페이지",
                            style: TextStyle(
                                fontFamily: "Pretendard",
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: GetRealWidth(pixel: 23, context: context),
                            height: GetRealHeight(pixel: 23, context: context),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Icon(
                                Icons.menu,
                                size:
                                GetRealHeight(pixel: 30, context: context),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: GetRealHeight(
                      pixel: 50, context: context),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(GetRealHeight(pixel: 30, context: context)),
                  child: Container(
                    width: double.infinity,
                    height: GetRealHeight(pixel: 687.5, context: context),
                    child: ListView(
                      physics:
                      BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
                      padding: EdgeInsets.zero,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: GetRealHeight(
                                      pixel: 57, context: context)),
                              child: Container(
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 74, context: context),
                                    ),
                                    Center(
                                        child: Text(
                                          "앱티브19기",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          ),
                                        )),
                                    Center(
                                        child: Text(
                                          "#48515",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.7),
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        )),
                                    Center(
                                        child: Text(
                                          "가입일: 2023.09.16",
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.7),
                                            fontFamily: "Pretendard",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        )),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 33, context: context),
                                    ),
                                    Container(
                                      height: 50,
                                      child:
                                      Row(
                                        children: [
                                          RealSizedBox(width: 80, height: 0),
                                          Link_SocialPage(),
                                          RealSizedBox(width: 40, height: 0),
                                          Link_SocialPage(),
                                          RealSizedBox(width: 40, height: 0),
                                          Link_SocialPage(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 33, context: context),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("프로필 편집 눌리;ㅁ");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile_User()));
                                      },
                                      child: Container(
                                          width: GetRealWidth(
                                              pixel: 350, context: context),
                                          height: GetRealHeight(
                                              pixel: 45, context: context),
                                          decoration: BoxDecoration(
                                              color:
                                              Color.fromRGBO(88, 0, 255, 1),
                                              borderRadius:
                                              BorderRadius.circular(20)),
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
                                    SizedBox(
                                      height: 58,
                                    ),
                                    Container(
                                        width: GetRealWidth(
                                            pixel: 352, context: context),
                                        child: Divider(
                                            color: Colors.white30,
                                            thickness: 2.0)),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 25, context: context),
                                    ),
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: GetRealWidth(
                                                pixel: 19, context: context)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "나의 상태",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 12, context: context),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.grey,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset('assets/images/mypage/status_green_circle.png'),
                                          Text(
                                            "통화가능 (온라인)",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Pretendard",
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SimpleSwitch(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 10, context: context),
                                    ),
                                    Container(
                                        width: GetRealWidth(
                                            pixel: 352, context: context),
                                        child: Divider(
                                            color: Colors.white30,
                                            thickness: 2.0)),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 20, context: context),
                                    ),
                                    //// 여기서 부턴 통화기록 //////
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: GetRealWidth(
                                                pixel: 19, context: context)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "통화유형 (음성, 영상 중 1택)",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 12, context: context),
                                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("음성");
                          },
                          child: Container(
                              width: GetRealWidth(
                                  pixel: 150, context: context),
                              height: GetRealHeight(
                                  pixel: 60, context: context),
                              decoration: BoxDecoration(
                                  color:
                                  Color.fromRGBO(88, 0, 255, 1),
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "음성",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Pretendard",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("영상");
                          },
                          child: Container(
                              width: GetRealWidth(
                                  pixel: 150, context: context),
                              height: GetRealHeight(
                                  pixel: 60, context: context),
                              decoration: BoxDecoration(
                                  color:
                                  Color.fromRGBO(88, 0, 255, 1),
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "영상",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Pretendard",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ],
                    ),
                                    RealSizedBox(width: 0, height: 50),
                                    //// 여기서 부턴 통화 //////
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: GetRealWidth(
                                                pixel: 19, context: context)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "통화시간",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 12, context: context),
                                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("음성");
                          },
                          child: Container(
                              width: GetRealWidth(
                                  pixel: 150, context: context),
                              height: GetRealHeight(
                                  pixel: 60, context: context),
                              decoration: BoxDecoration(
                                  color:
                                  Color.fromRGBO(88, 0, 255, 1),
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "음성",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Pretendard",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("영상");
                          },
                          child: Container(
                              width: GetRealWidth(
                                  pixel: 150, context: context),
                              height: GetRealHeight(
                                  pixel: 60, context: context),
                              decoration: BoxDecoration(
                                  color:
                                  Color.fromRGBO(88, 0, 255, 1),
                                  borderRadius:
                                  BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "영상",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Pretendard",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                        ),
                      ],
                    ),
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: GetRealWidth(
                                                pixel: 19, context: context)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "통화권가격",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    TextField(
                                      
                                    ),
                                    SizedBox(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: GetRealWidth(
                                                pixel: 19, context: context)),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                "통화규칙",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("프로필 편집 눌리;ㅁ");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile_User()));
                                      },
                                      child: Container(
                                          width: GetRealWidth(
                                              pixel: 350, context: context),
                                          height: GetRealHeight(
                                              pixel: 45, context: context),
                                          decoration: BoxDecoration(
                                              color:
                                              Color.fromRGBO(88, 0, 255, 1),
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              "통화규칙",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("프로필 편집 눌리;ㅁ");
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile_User()));
                                      },
                                      child: Container(
                                          width: GetRealWidth(
                                              pixel: 350, context: context),
                                          height: GetRealHeight(
                                              pixel: 45, context: context),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              "통화시작",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Pretendard",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: GetRealHeight(
                                          pixel: 150, context: context),
                                    ),

                                  ],
                                ),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 24,
                                          color: Colors.black26,
                                          offset: Offset(3, -3)),
                                    ],
                                    color: Colors.black,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30))),
                              ),
                            ),
                            Center(
                                child: Container(
                                  width: GetRealWidth(pixel: 110, context: context),
                                  height: GetRealHeight(pixel: 110, context: context),
                                  child: FittedBox(fit: BoxFit.fill,child: Icon(CupertinoIcons.person_fill,)),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
