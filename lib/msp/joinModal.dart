import 'package:flutter/material.dart';

//import 'package:permission_handler/permission_handler.dart';
import 'package:bridge/msp/Classes.dart';
import 'package:bridge/msp/functions.dart';
import 'package:bridge/msp/viewstyle.dart';

void main() async{
  runApp(const BottomSheetApp());
//   if (await Permission.contacts.request().isGranted) {
// // Either the permission was already granted before or the user just granted it.
//     print("Permission granted!");
//   }
//   else
//   {
//     Permission.notification.request();
//   }
}


class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const JoinModalFirst(),
      ),
    );
  }
}

class JoinButton extends StatelessWidget
{
  BuildContext? myContext;
  double? myWidth;
  double? myHeight;
  Widget? myWidget;
  ButtonStyle? myButtonStyle = OutlinedButton.styleFrom(
      backgroundColor: Color(0xff222222),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      side: BorderSide(color: Color(0xff222222), width: 1.4)
  );
  TextStyle myTextStyle = SimpleTextStyle(size: 17, color: Colors.white, weight: FontWeight.w500);
  late String myText;

  JoinButton({required BuildContext context, required double width,  required double height, required String text, required Widget widget, ButtonStyle? buttonStyle, TextStyle? textStyle}){
    myContext = context;
    myWidth = width;
    myHeight = height;
    myText = text;
    myWidget = widget;

    if(buttonStyle != null)
      {
        myButtonStyle = buttonStyle;
      }
    if(textStyle != null)
      {
        myTextStyle = textStyle;
      }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: OutlinedButton(
        onPressed: ()
        {
          Navigator.push(context, ModalBottomSheetRoute(builder: (context) => myWidget!, isScrollControlled: false));
        },
        style: myButtonStyle,
        child: Text(myText, style: myTextStyle,),
      ),
    );
  }

}


class JoinModalFirst extends StatelessWidget {
  const JoinModalFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                // height: GetRealHeight(pixel: 1575, context: context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  color: colorWhite,
                ),
                child: Container(
                  height: GetRealHeight(pixel: 1575, context: context),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                                  child:
                                  Row(
                                      children: [
                                        Image.asset("assets/images/JoinModal/icon_left.png"),
                                        SizedBox(width: GetRealWidth(pixel: 130, context: context),),
                                        Text("참여하기", style: textstyleBoxHeader,),
                                        SizedBox(width: GetRealWidth(pixel: 122, context: context),),
                                        Image.asset("assets/images/JoinModal/icon_x.png"),
                                      ]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 39, context: context), GetRealHeight(pixel: 50, context: context), 0, 0),
                                  child:
                                  Row(
                                      children: [
                                        Text("부산은행 앞", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: colorDarkBlue),),
                                        SizedBox(width: GetRealWidth(pixel: 113, context: context),),
                                        Text("am 02시 30분", style: SimpleTextStyle(size: 19, weight: FontWeight.w600),),
                                      ]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 38, context: context), GetRealHeight(pixel: 37, context: context), 0, 0),
                                  child:
                                  Row(
                                      children: [
                                        Text("동승자의 경유지를 확인해주세요", style: SimpleTextStyle(size: 17, weight: FontWeight.w600),),
                                      ]
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 37, context: context), GetRealHeight(pixel: 30, context: context), 0, 0),
                                  child:
                                  Column(
                                    children: [
                                      Row(
                                          children: [
                                            Text("1   명륜역", style: SimpleTextStyle(size: 17),),
                                          ]
                                      ),
                                      RealSizedBox(width: 0, height: 25),
                                      Row(
                                          children: [
                                            Text("2   명륜동 황금손한방병원", style: SimpleTextStyle(size: 17),),
                                          ]
                                      ),
                                      RealSizedBox(width: 0, height: 25),
                                      Row(
                                          children: [
                                            Text("3   부곡동 거제한양아파트", style: SimpleTextStyle(size: 17),),
                                          ]
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      RealSizedBox(width: 0, height: 30),
                      JoinButton(context: context,
                          width: GetRealWidth(pixel: 310, context: context),
                          height: GetRealHeight(pixel: 47, context: context),
                          text: "참여하기",
                          widget: JoinModalSecond())
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class JoinModalSecond extends StatelessWidget {
  const JoinModalSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetRealHeight(pixel: 575, context: context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Image.asset("assets/images/JoinModal/icon_left.png"),
                        SizedBox(width: GetRealWidth(pixel: 130, context: context),),
                        Text("참여하기", style: textstyleBoxHeader,),
                        SizedBox(width: GetRealWidth(pixel: 122, context: context),),
                        Image.asset("assets/images/JoinModal/icon_x.png"),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Text("본인의 목적지를 입력해주세요", style: SimpleTextStyle(size: 17, weight: FontWeight.w600, color: colorBlack),),
                      ]
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 0, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                    width: GetRealWidth(pixel: 333, context: context),
                    height: GetRealHeight(pixel: 49, context: context),
                    child:
                    TextField(
                      decoration: InputDecoration(
                          hintText: "목적지 입력"
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 54, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Text("택시팟에 무단으로 나오지 않거나, 비매너 행동을 하면\n 사용자의 신고로 인해 앱 사용이 제한될 수 있습니다.", style: SimpleTextStyle(size: 13, weight: FontWeight.w400, color: Color(0xff5C5050)),),
                      ]
                  ),
                ),
                RealSizedBox(width: 0, height: 100),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 19, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        JoinButton(context: context, width: GetRealWidth(pixel: 126, context: context), height: GetRealHeight(pixel: 47, context: context), text: "이전", widget: JoinModalFirst(),
                          buttonStyle: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xffF5F5F5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              side: BorderSide(color: Color(0xffF5F5F5), width: 1.4)
                          ),
                          textStyle: SimpleTextStyle(size: 17, color: Colors.black, weight: FontWeight.w500),
                        ),
                        RealSizedBox(width: 103, height: 0),
                        JoinButton(context: context, width: GetRealWidth(pixel: 126, context: context), height: GetRealHeight(pixel: 47, context: context), text: "다음", widget: JoinModalThird())
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class JoinModalThird extends StatelessWidget {
  const JoinModalThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetRealHeight(pixel: 575, context: context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Image.asset("assets/images/JoinModal/icon_left.png"),
                        SizedBox(width: GetRealWidth(pixel: 99, context: context),),
                        Text("알림 및 유의사항", style: textstyleBoxHeader,),
                        SizedBox(width: GetRealWidth(pixel: 92, context: context),),
                        Image.asset("assets/images/JoinModal/icon_x.png"),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                  child:
                  Column(
                    children: [
                      Row(
                          children: [
                            Text("유의사항", style: SimpleTextStyle(size: 17, weight: FontWeight.w600, color: colorBlack),),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 18, context: context),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: GetRealWidth(pixel: 330, context: context),
                              height: GetRealHeight(pixel: 54, context: context),
                              decoration: BoxDecoration(
                                  color: Color(0xff2192FB),
                                  borderRadius: BorderRadius.circular(24)
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      child: SimpleCheckbox(),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 20, context: context), 0, 0, 0),
                                      child: Text("시간을 준수해 주세요", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: Colors.white),)
                                  ),
                                ],
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: GetRealHeight(pixel: 16, context: context),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: GetRealWidth(pixel: 330, context: context),
                                height: GetRealHeight(pixel: 127, context: context),
                                decoration: BoxDecoration(
                                    color: Color(0xff2192FB),
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                    child: SimpleCheckbox(),
                                  ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 20, context: context), 0, 0, 0),
                                        child: Text("지각이나 잠수등의 비매너 행동은\n동승자로 인해 신고당할 수 있으며\n앱 사용이 제한 될 수 있음에 동의\n합니다", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: Colors.white),)),
                                  ],
                                )),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 36, context: context),),
                      Row(
                          children: [
                            Text("출발 30분 전 알림을 받아요", style: SimpleTextStyle(size: 17, weight: FontWeight.w400, color: colorBlack),),
                            RealSizedBox(width: 96, height: 0),
                            SimpleSwitch(),
                          ]
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 21, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        JoinButton(context: context, width: GetRealWidth(pixel: 126, context: context), height: GetRealHeight(pixel: 47, context: context), text: "이전", widget: JoinModalFirst(),
                          buttonStyle: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xffF5F5F5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              side: BorderSide(color: Color(0xffF5F5F5), width: 1.4)
                          ),
                          textStyle: SimpleTextStyle(size: 17, color: Colors.black, weight: FontWeight.w500),
                        ),
                        RealSizedBox(width: 103, height: 0),
                        JoinButton(context: context, width: GetRealWidth(pixel: 126, context: context), height: GetRealHeight(pixel: 47, context: context), text: "다음", widget: JoinModalFourth())
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JoinModalFourth extends StatelessWidget {
  const JoinModalFourth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetRealHeight(pixel: 575, context: context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Image.asset("assets/images/JoinModal/icon_left.png"),
                        SizedBox(width: GetRealWidth(pixel: 99, context: context),),
                        Text("정산 및 오픈채팅", style: textstyleBoxHeader,),
                        SizedBox(width: GetRealWidth(pixel: 92, context: context),),
                        Image.asset("assets/images/JoinModal/icon_x.png"),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                  child:
                  Column(
                    children: [
                      Row(
                          children: [
                            Text("정산은 아래의 오픈채팅을 통해\n멤버들과 조정할 수 있어요", style: SimpleTextStyle(size: 24, weight: FontWeight.w600, color: colorBlack),),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 28, context: context),),
                      Row(
                          children: [
                            Text("오픈채팅방 링크와 참가한 택시팟은\n하단 네비게이션 바의 '확인'페이지에서 재확인 가능합니다", style: SimpleTextStyle(size: 14, weight: FontWeight.w400, color: Color(0xff5C5050)),),
                          ]
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 21, context: context), GetRealHeight(pixel: 100, context: context), 0, 0),
                  child:
                  Column(
                      children: [
                        JoinButton(context: context, width: GetRealWidth(pixel: 310, context: context), height: GetRealHeight(pixel: 47, context: context), text: "완료", widget: JoinModalThird())
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}