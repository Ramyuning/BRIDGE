import 'package:bridge/jjh/finish_page.dart';
import 'package:bridge/msp/Classes.dart';
import 'package:flutter/material.dart';
import 'package:bridge/msp/functions.dart';
import 'package:bridge/jjh/callrecord_user.dart';
import 'package:bridge/jjh/edit_profile_user.dart';
import 'package:bridge/jjh/followed_creator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bridge/msp/Webview.dart';

class Link_SocialPage extends StatelessWidget
{
  String reqURL = 'http://www.youtube.com/';
  Link_SocialPage(String url)
  {
    reqURL = url;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Link Clicked!");
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(reqURL)));
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

class Edit_Profile_Creator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("프로필 편집",  style: SimpleTextStyle(size: 15)),
      ),
    );
  }
}
class Page_Call_Rules extends StatelessWidget {

  String _currentRulesText = '';

  @override
  Widget build(BuildContext context) {

    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: statusBarHeight,
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              GoBackButton(),
              Text(
                "통화규칙",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              Container(
                width: GetRealWidth(pixel: 350, context: context),
                height: GetRealHeight(pixel: 280, context: context),
                color: Colors.white,
              child: TextField(),
              ),
              GestureDetector(
                onTap: () {
                  print("입력 완료");
                  Navigator.pop(context);
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
                        "완료",
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
        ),
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
                                          Link_SocialPage(URL_YOUTUBE),
                                          RealSizedBox(width: 40, height: 0),
                                          Link_SocialPage(URL_INSTAGRAM),
                                          RealSizedBox(width: 40, height: 0),
                                          Link_SocialPage(URL_TWITCH),
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile_Creator()));
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
                                    MyCallStatus(),
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

class MyCallStatus extends StatefulWidget
{
  @override
  State<MyCallStatus> createState() => _MyCallStatusState();
}

class _MyCallStatusState extends State<MyCallStatus> {
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
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
          width: GetRealWidth(pixel: 352, context: context),
          height: GetRealHeight(pixel: 45, context: context),

          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.15),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: GetRealWidth(pixel: 13, context: context),
                height: GetRealHeight(pixel: 13, context: context),
                decoration: BoxDecoration(
                  color: Colors.lightGreenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              RealSizedBox(width: 9, height: 0),
              Text(
                "통화가능 (온라인)",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              RealSizedBox(width: 131, height: 0),
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
        Call_Type_Selecter(),
        RealSizedBox(width: 0, height: 50),
        //// 여기서 부턴 통화 시간//////
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button_CallDuration("30초"),
            Button_CallDuration("1분"),
            Button_CallDuration("3분"),
          ],
        ),
        RealSizedBox(width: 0, height: 7),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button_CallDuration("5분"),
            Button_CallDuration("10분"),
            Button_CallDuration("15분"),
          ],
        ),
        RealSizedBox(width: 0, height: 20),
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
        RealSizedBox(width: 0, height: 51),
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
        RealSizedBox(width: 0, height: 20),
        GestureDetector(
          onTap: () {
            print("규칙은 깨지라고 있는 것");
            Navigator.push(context, MaterialPageRoute(builder: (context) => Page_Call_Rules()));
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
        RealSizedBox(width: 0, height: 69),
        GestureDetector(
          onTap: () {
            print("시작");
          },
          child: Container(
              width: GetRealWidth(
                  pixel: 350, context: context),
              height: GetRealHeight(
                  pixel: 48, context: context),
              decoration: BoxDecoration(
                  color:
                  Colors.green,
                  borderRadius:
                  BorderRadius.circular(16)),
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
      ],
    );
  }
}

class Button_CallDuration extends StatelessWidget
{

  String buttonText = 'Default';

  Button_CallDuration(String text)
  {
    buttonText = text;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(buttonText + " pressed!");
      },
      child: Container(
          width: GetRealWidth(
              pixel: 112, context: context),
          height: GetRealHeight(
              pixel: 45, context: context),
          decoration: BoxDecoration(
              color:
              Color.fromRGBO(88, 0, 255, 1),
              borderRadius:
              BorderRadius.circular(8)),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Pretendard",
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class Call_Type_Selecter extends StatefulWidget
{
  @override
  State<Call_Type_Selecter> createState() => _Call_Type_SelecterState();
}

class _Call_Type_SelecterState extends State<Call_Type_Selecter>
{
  int _selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            print("음성");
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Container(
              width: GetRealWidth(
                  pixel: 167, context: context),
              height: GetRealHeight(
                  pixel: 67, context: context),
              decoration: BoxDecoration(
                  color:

                  Color.fromRGBO(88, 0, 255, 1),
                  borderRadius:
                  BorderRadius.circular(8)),
              child: Center(
                  child: Image.asset('assets/images/mypage/voice_call.png')
              )),
        ),
        GestureDetector(
          onTap: () {
            print("영상");
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Container(
              width: GetRealWidth(
                  pixel: 167, context: context),
              height: GetRealHeight(
                  pixel: 67, context: context),
              decoration: BoxDecoration(
                  color:
                  Color.fromRGBO(255, 255, 255, 0.15),
                  borderRadius:
                  BorderRadius.circular(8)),
              child: Center(
                  child: Image.asset('assets/images/mypage/video_call.png')
              )),
        ),
      ],
    );
  }
}
