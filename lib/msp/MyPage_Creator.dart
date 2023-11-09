import 'package:bridge/msp/Classes.dart';
import 'package:flutter/material.dart';
import 'package:bridge/msp/functions.dart';

class Mypage_Creator extends StatefulWidget {
  const Mypage_Creator({super.key});

  @override
  State<Mypage_Creator> createState() => _Mypage_CreatorState();
}

class _Mypage_CreatorState extends State<Mypage_Creator> {


  @override
  void initState() {

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
              SizedBox(
                height: GetRealHeight(pixel: 34, context: context),
              ),
              Text(
                  "마이페이지",
                  style: SimpleTextStyle(size: 28, weight: FontWeight.w600)
              ),
              SizedBox(
                height: GetRealHeight(pixel: 87, context: context),
              ),
              Text(
                "앱티브19기",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 9,
                      ),
                    ],
                  )),
              //이름 칸
              Text(
                "#48515",
                style: SimpleTextStyle(size: 16, weight: FontWeight.w500),
              ),
              SizedBox(
                height: GetRealHeight(pixel: 9, context: context),
              ),
              Container(
                  height: GetRealHeight(pixel: 80, context: context),
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 9,
                      ),
                    ],
                  )),
              SizedBox(
                height: GetRealHeight(pixel: 15, context: context),
              ),
              Row(
                children: [
                  Text(
                    "가입일 : 2023. 09. 16",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              RealSizedBox(width: 0, height: 9),
            ],
          ),
        ),
      ),
    );
  }
}