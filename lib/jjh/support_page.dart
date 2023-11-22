import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Support_Page extends StatefulWidget {
  const Support_Page({super.key});

  @override
  State<Support_Page> createState() => _Support_PageState();
}

class _Support_PageState extends State<Support_Page> 
  with TickerProviderStateMixin {
    late Animation<double> _animation;
    late AnimationController _animation_controller;

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
  bool first_qna = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation_controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _animation_controller,
      curve: Curves.ease,
    );
    _animation.addListener(() {
      setState(() {});
    });
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
                      
                

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top:GetRealHeight(pixel: 11, context: context)),
                  child: Text(
                                  "고객센터",
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                ),
                          Padding(
                            padding: EdgeInsets.only(left: GetRealWidth(pixel: 20, context: context),top: GetRealHeight(pixel: 20, context: context)),
                            child: Row(children: [Text(
                                  "FAQ | 자주 묻는 질문",
                                  style: TextStyle(
                                      fontFamily: "Pretendard",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),],),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:GetRealHeight(pixel: 30, context: context)),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (first_qna == false){
                                    first_qna = true;
                                    _animation_controller.forward();} 
                                  else{
                                    first_qna = false;
                                    _animation_controller.reset();
                                  }
                                }); 
                              },
                              child: Container(width: MediaQuery.of(context).size.width,height: GetRealHeight(pixel: 54, context: context),decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2)),child: Center(child: Padding(
                                padding: EdgeInsets.symmetric(horizontal:GetRealWidth(pixel: 20, context: context)),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
                                        "Q. 회원탈퇴는 어떻게 하나요?",
                                        style: TextStyle(
                                            fontFamily: "Pretendard",
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),Icon(Icons.expand_more,color: Colors.white,)],),
                              )),),
                            ),
                          ),
                          first_qna? Container(width: MediaQuery.of(context).size.width,height: GetRealHeight(
                                      pixel: _animation.value * 90,
                                      context: context),decoration: BoxDecoration(color: Color.fromRGBO(39 ,38 ,38, 1)),child: Padding(
                            padding: EdgeInsets.only(top:GetRealHeight(pixel: 20, context: context),left: GetRealWidth(pixel: 20, context: context)),
                            child: Text(
                                          "A: 회원탈퇴 버튼이 이 세상 어딘가에 숨겨져 있습니다! \n     그걸 반드시 찾아보는 시간을 갖도록 하세요~",
                                          style: TextStyle(
                                              fontFamily: "Pretendard",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                          ),) : Container(),
                          GestureDetector(
                          onTap: () {
                            setState(() {
                              first_qna = false;
                            });
                          },
                            child: Container(width: MediaQuery.of(context).size.width,height: GetRealHeight(pixel: 54, context: context),decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2)),child: Center(child: Padding(
                              padding: EdgeInsets.symmetric(horizontal:GetRealWidth(pixel: 20, context: context)),
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
                                      "Q. 앱티브19기의 숨겨진 비밀.txt",
                                      style: TextStyle(
                                          fontFamily: "Pretendard",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),Icon(Icons.expand_more,color: Colors.white,)],),
                            )),),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
