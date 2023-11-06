import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Call_Record_User extends StatelessWidget {
  late double height_PX;
  late double width_PX;
  Call_Record_User({super.key, required height, required width}) {
    height_PX = height;
    width_PX = width;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350 * width_PX,
      height: 68 * height_PX,
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 52 * width_PX,
                height: 52 * height_PX,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: FittedBox(fit: BoxFit.fill,child: Icon(CupertinoIcons.person_crop_circle_fill)),
              ),
              SizedBox(
                width: 9 * width_PX,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "크리에이터1",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 1*height_PX,),
                  Text(
                    "5min",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                ],
              ),
              SizedBox(
                width: 125 * width_PX,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,children: [Text(
                    "2023. 9. 19. 18:48",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                  SizedBox(height: 4*height_PX,),
                  Text(
                    "2000P",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),],)
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                                        width:
                                            292,
                                        child: Divider(
                                            color: Colors.white30, thickness: 2.0)),
          ),
        ],
      ),
    );
  }
}

class Call_Record_Page extends StatefulWidget {
  const Call_Record_Page({super.key});

  @override
  State<Call_Record_Page> createState() => _Call_Record_PageState();
}

class _Call_Record_PageState extends State<Call_Record_Page> {
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
        decoration: BoxDecoration(color: Colors.black),
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
                      top: GetRealHeight(pixel: 5, context: context)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: GetRealHeight(pixel: 18, context: context),
                        height: GetRealHeight(pixel: 18, context: context),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(
                            CupertinoIcons.left_chevron,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: GetRealWidth(pixel: 58, context: context),
                          height: GetRealHeight(pixel: 22, context: context),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: GestureDetector(
                              onTap: () {Navigator.pop(context);},
                              child: Text(
                                "뒤로가기",
                                style: TextStyle(
                                    fontFamily: "Pretendard",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: GetRealWidth(pixel: 36, context: context),),
                      Container(
                        width: GetRealWidth(pixel: 128, context: context),
                        height: GetRealWidth(pixel: 29, context: context),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: GetRealWidth(pixel: 1, context: context),),
                            Container(
                              width: GetRealWidth(pixel: 63, context: context),
                              height:
                                  GetRealHeight(pixel: 27, context: context),
                              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(GetRealWidth(pixel: 5, context: context))),child: Center(child: Text("안뇽")),
                            ),
                            Container(
                              width: GetRealWidth(pixel: 63, context: context),
                              height:
                                  GetRealHeight(pixel: 27, context: context),
                              decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(GetRealWidth(pixel: 5, context: context))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: GetRealHeight(pixel: 0, context: context),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: GetRealHeight(pixel: 723.5, context: context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: GetRealHeight(pixel: 20, context: context),
                        ),
                        Text(
                          "나의 통화 기록",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: GetRealHeight(pixel: 38, context: context),
                        ),
                        Container(
                          width: double.infinity,
                          height: 640,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Call_Record_User(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Call_Record_User(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Call_Record_User(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Call_Record_User(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Call_Record_User(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                        top: Radius.circular(30),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
