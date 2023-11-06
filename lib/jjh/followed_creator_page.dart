import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Followed_Creator_Class extends StatelessWidget {
  late double height_PX;
  late double width_PX;
  Followed_Creator_Class({super.key, required height, required width}) {
    height_PX = height;
    width_PX = width;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
      width: 350 * width_PX,
      height: 52 * height_PX,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 52 * width_PX,
            height: 52 * height_PX,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          SizedBox(
            width: 13 * width_PX,
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
              Text(
                "#12345",
                style: TextStyle(
                    fontFamily: "Pretendard",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
            ],
          ),
          SizedBox(
            width: 131 * width_PX,
          ),
          Container(
            width: 86 * width_PX,
            height: 36 * height_PX,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.5 * height_PX),
                color: Colors.white),
            child: Row(),
          )
        ],
      ),
    );
  }
}

class Followed_Creator_Page extends StatefulWidget {
  const Followed_Creator_Page({super.key});

  @override
  State<Followed_Creator_Page> createState() => _Followed_Creator_PageState();
}

class _Followed_Creator_PageState extends State<Followed_Creator_Page> {
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: GetRealHeight(pixel: 20, context: context),
                ),
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
                          "내가 팔로우한 크리에이터",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: GetRealHeight(pixel: 20, context: context),
                        ),
                        Container(
                          width: double.infinity,
                          height: 640,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Followed_Creator_Class(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Followed_Creator_Class(
                                width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                              ),
                              SizedBox(
                                height:
                                    GetRealHeight(pixel: 27, context: context),
                              ),
                              Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
                                                ),
                                                Followed_Creator_Class(
                          width: GetRealWidth(pixel: 1, context: context),
                          height: GetRealHeight(pixel: 1, context: context),
                                                ),
                                                SizedBox(
                          height: GetRealHeight(pixel: 27, context: context),
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
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30),)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
