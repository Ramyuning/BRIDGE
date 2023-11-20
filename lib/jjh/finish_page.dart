//완료 페이지
import 'package:bridge/jjh/mypage_user.dart';
import 'package:flutter/material.dart';

import '../msp/functions.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Image(
              image: AssetImage("assets/images/inputnickname/leftvector.png")),
          SizedBox(
            width: GetRealWidth(pixel: 3, context: context),
          ),
          Text("뒤로가기",
              style: SimpleTextStyle(
                  size: 16, color: Colors.white, weight: FontWeight.w300)),
        ],
      ),
    );
  }
}

class Finish_Page extends StatefulWidget {
  const Finish_Page({super.key});

  @override
  State<Finish_Page> createState() => _Finish_PageState();
}

class _Finish_PageState extends State<Finish_Page> {
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.only(
              left: GetRealWidth(pixel: 30, context: context),
              right: GetRealWidth(pixel: 30, context: context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: GetRealHeight(pixel: 65, context: context),
              ),
              GoBackButton(),
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text("팬과 이어지는 공간\nBRIDGE에\n오신 걸 환영해요!",
                  style: SimpleTextStyle(size: 28, weight: FontWeight.w600)),
              SizedBox(
                height: GetRealHeight(pixel: 87, context: context),
              ),
              Center(
                  child: Container(
                      width: GetRealWidth(pixel: 199, context: context),
                      height: GetRealHeight(pixel: 187, context: context),
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image(
                              image: AssetImage(
                                  "assets/images/finishpage/image-3.png"))))),
              SizedBox(
                height: GetRealHeight(pixel: 124, context: context),
              ),
              Container(
                width: GetRealWidth(pixel: 330, context: context),
                height: GetRealHeight(pixel: 45, context: context),
                decoration: BoxDecoration(
                    // color: Color.fromRGBO(88, 0, 255, 1),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(88, 0, 255, 0.5),
                        // color: Color.fromRGBO(0, 0, 0, 0.25),
                        // color: Color.fromRGBO(0, 0, 0, 0.25)
                        // color: Colors.white
                      ),
                      BoxShadow(
                          color: Color.fromRGBO(88, 0, 255, 1),
                          spreadRadius: -2.0,
                          blurRadius: 3.0,
                          offset: Offset(0, 2)),
                    ],
                    borderRadius: BorderRadius.circular(30)),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
	builder: (context) => const MyPage_user()), (route) => false);
                    },
                    child: Container(
                      width: ButtonTheme.of(context).minWidth,
                      height: ButtonTheme.of(context).height,
                      child: Center(
                        child: Text(
                          "시작하기",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.2),
                        ),
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.blue,
              //       gradient: LinearGradient(
              //         begin: FractionalOffset.bottomLeft,
              //         end: FractionalOffset.topRight,
              //         colors: <Color>[Colors.purple, Colors.orange],
              //       ),
              //       borderRadius: BorderRadius.circular(11),
              //       boxShadow: [
              //         BoxShadow(color: Colors.yellow, offset: Offset(2.0, 5.0))
              //       ]),
              //   child: Material(
              //     borderRadius: BorderRadius.circular(11),
              //     clipBehavior: Clip.hardEdge,
              //     child: InkWell(
              //       onTap: () {
              //         print("tapped");
              //       },
              //       child: Container(
              //         width: ButtonTheme.of(context).minWidth,
              //         height: ButtonTheme.of(context).height,
              //         child: Center(
              //           child: Text(
              //             "log in",
              //             style: TextStyle(
              //                 color: Colors.white, fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ),
              //     color: Colors.transparent,
              //   ),
              // ),
              // Container(
              //   child: Center(child: Text('Geeks for Geeks')),
              //   height: 100,
              //   width: 100,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(50),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.green,
              //       ),
              //       BoxShadow(
              //         color: Colors.white70,
              //         spreadRadius: -5.0,
              //         blurRadius: 20.0,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
