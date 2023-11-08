import 'dart:convert';

import 'package:bridge/jjh/generator_class/follow_list_convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



Future<List> fetchInfo(url) async {
  /// 이곳은 네트워크 통신을 하여 json을 가져오는 곳입니다 ///////
  // final jsonString = await http.get(Uri.parse(url));

  // if (jsonString.statusCode == 200) {
  //   //만약 서버가 ok응답을 반환하면, json을 파싱합니다
  //   // print('백엔드쪽에서 응답 완료.');
  //   var jsonstring = utf8.decode(jsonString.bodyBytes);
  //   // print(json.decode(jsonString.body));
  //   List<dynamic> jsonMaps = jsonDecode(jsonstring);
  //   List<roomMember> jsonLists =
  //       jsonMaps.map((dynamic item) => roomMember.fromJson(item)).toList();
  //   return jsonLists;
  //   // return Info.fromJson(json.decode(response.body));
  // } else {
  //   //만약 응답이 ok가 아니면 에러를 던집니다.
  //   throw Exception('몬가 몬가 에러임');
  // }
  //// 혼자 테스트한곳 //////
  String jsonString = await rootBundle.loadString('assets/testjson/follow_list.json');
  List<dynamic> jsonMaps = jsonDecode(jsonString);
  List<Follows> jsonLists =
      jsonMaps.map((dynamic item) => Follows.fromJson(item)).toList();
  // Follow_json follow_json = Follow_json.fromJson(jsonMaps);
  return jsonLists;
  //// 여기까지 남겨두기 //////
}

// 내가 팔로우한 크리에이터 리스트 항목 Class //

class Followed_Creator_Class extends StatelessWidget {
  late double height_PX;
  late double width_PX;
  late Follows lsts;
  Followed_Creator_Class({super.key, required height, required width,required lsts}) {
    height_PX = height;
    width_PX = width;
    this.lsts = lsts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350 * width_PX,
      height: 52 * height_PX,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 52 * width_PX,
                height: 52 * height_PX,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Image(image: NetworkImage(lsts.profileImg)),
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
                    lsts.creatorName,
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Text(
                    "#${lsts.creatorId}",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(
          //   width: 131 * width_PX,
          // ),
          Container(
            width: 86 * width_PX,
            height: 36 * height_PX,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.5 * height_PX),
                color: Colors.white.withOpacity(0.15)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(CupertinoIcons.heart_fill,color: Colors.pink,size: 17,),Text(lsts.followerCount.toString(),style: TextStyle(color: Colors.white,fontFamily: "Pretendard",fontWeight: FontWeight.w500,fontSize: 15),)],),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    dynamic follow_json = fetchInfo("123");
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        //통신데이터 가져오기
        future: fetchInfo("123"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            // print(snapshot.data.toString());
            print("성공적");
            return buildColumn(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}에러!!");
            // return buildColumn(snapshot);
          }
          return CircularProgressIndicator();
          // return buildColumn(snapshot);
        },
      ),
    ));
  }



  Widget buildColumn(snapshot) {
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
                          child: (snapshot.data.length == 0)
                  ? Center(
                      child: Text(
                      "아직 방이 없어요ㅜ",
                      style: TextStyle(color: Colors.white),
                    ))
                  : ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              
                              for (Follows inlsts in snapshot.data) ...[
                Followed_Creator_Class(width: GetRealWidth(pixel: 1, context: context),
                                height:
                                    GetRealHeight(pixel: 1, context: context),
                                    lsts: inlsts,),
                                    SizedBox(height: GetRealHeight(pixel: 17, context: context),)
              ],
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

